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
#include "mqtt_app.h"
#include "wifi_app.h"
#include "uart_app.h"

// APPS
uint8_t SSID[] = "kotamas_asri 1";
uint8_t PASS[] = "dadank89";

void initialize(void);
void routine(void *arg);
void thread_function(void);

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
    // uart init
    uart0_init(115200,UART_DATA_8_BITS,UART_HW_FLOWCTRL_DISABLE,UART_PARITY_DISABLE,UART_STOP_BITS_1,UART_SCLK_APB);
    // init wifi
    wifi_init_sta(SSID,PASS,3);
    // mqtt init
    mqtt_init("192.168.1.5",1833,"pi","raspberry");
    mqtt_subscribe("sub_topic");
}

void routine(void *arg)
{
    while (1)
    {
        uint8_t data_buffer[1024];
        bzero(data_buffer,1024);
        
        vTaskDelay(pdMS_TO_TICKS(1000));
        if (data_stat == 1){
            data_stat = 0;
            // send uart buffer via wifi-mqtt to server
            for (int i=0;i<data_len-1;i++){
                //copy data buffer
                data_buffer[i] = uart0_evt_buff[i];
                // publish uart data
                mqtt_publish("pub_topic",(char *)data_buffer);
            }
        }
    }
    
}

//EOF
