/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "driver/adc.h"
#include "mqtt_app.h"
#include "wifi_app.h"
#include "uart_app.h"
#include "dht22.h"

// APPS
uint8_t SSID[] = "M2M Personal";
uint8_t PASS[] = "tr1tr0n1k";

void initialize(void);
void routine(void *arg);
void thread_function(void);
void read_sensor(void);

void app_main(void)
{
    printf("Hello world!\n");
    initialize();
    xTaskCreate(routine,"routine task",2*4096,NULL,2,NULL);
	vTaskDelay(pdMS_TO_TICKS(1000));
    while (1){
        vTaskDelay(pdMS_TO_TICKS(1000));
    }    
}

void initialize(void)
{
    // init wifi
    wifi_init(SSID,PASS,WIFI_AUTH_WPA2_PSK);
    // uart init
    vTaskDelay(pdMS_TO_TICKS(1000));
    uart0_init(115200,UART_DATA_8_BITS,UART_HW_FLOWCTRL_DISABLE,UART_PARITY_DISABLE,UART_STOP_BITS_1,UART_SCLK_APB);
    // mqtt init
    vTaskDelay(pdMS_TO_TICKS(3000));
    mqtt_init("mqtt://192.168.1.7",1883,"pi","raspberry");
    mqtt_subscribe("sensor/data");
    // ADC init
    adc1_config_width(ADC_WIDTH_BIT_DEFAULT);
    adc1_config_channel_atten(ADC1_CHANNEL_1, ADC_ATTEN_DB_0);
    adc1_config_channel_atten(ADC1_CHANNEL_0, ADC_ATTEN_DB_0);
}

void routine(void *arg)
{
    int cnt = 0;

    while (1)
    {
        uint8_t data_buffer[1024];
        bzero(data_buffer,1024);
        
        vTaskDelay(pdMS_TO_TICKS(500));
        if (data_stat == 1){
            data_stat = 0;
            cnt++;
            // send uart buffer via wifi-mqtt to server
            printf("data len:%i\r\n",data_len);
            for (int i=0;i<data_len;i++){
                //copy data buffer
                data_buffer[i] = uart0_evt_buff[i];
            }
            printf("%s\r\n",data_buffer);
            // publish uart data
            mqtt_publish("sensor/data",(char *)data_buffer);
            if (cnt>1){
                cnt = 0;
                read_sensor();
            }
        }
        //read_sensor();
    }
}

void read_sensor(void)
{
// test sensor
    char payload_buff[256];
    bzero(payload_buff,256);
    int adc_gas;
    int adc_batt;
    adc_gas = adc1_get_raw(ADC1_CHANNEL_1);
    adc_batt = adc1_get_raw(ADC1_CHANNEL_0);
    readDHT();
    //printf("gas:%i, battery:%i\r\n", adc_gas, adc_batt);
    //printf("Hum: %.1f Tmp: %.1f\n", getHumidity(), getTemperature());
    sprintf(payload_buff,"{\"gas\":%i}",adc_gas);
    mqtt_publish("sensor/data",payload_buff);
    bzero(payload_buff,256);
    sprintf(payload_buff,"{\"batt\":%i}",adc_batt);
    mqtt_publish("sensor/data",payload_buff);
    bzero(payload_buff,256);
    sprintf(payload_buff,"{\"temperature\":%f}",getTemperature());
    mqtt_publish("sensor/data",payload_buff);
    bzero(payload_buff,256);
    sprintf(payload_buff,"{\"humidity\":%f}",getHumidity());
    mqtt_publish("sensor/data",payload_buff);
    bzero(payload_buff,256);
    vTaskDelay(pdMS_TO_TICKS(3000));
}
//EOF
