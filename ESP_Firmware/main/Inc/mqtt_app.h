/*
 *  mqtt_app.h file
 *
 * 	author	: Dadan
 * 	email	: dadanugm07@gmail.com
 * 	date	: 8/2/2021
 * 	revison	:
 *
*/


#ifndef __MQTT_APP_H
#define __MQTT_APP_H

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "esp_wifi.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include "esp_event.h"
#include "esp_netif.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"

#include "lwip/sockets.h"
#include "lwip/dns.h"
#include "lwip/netdb.h"

#include "esp_log.h"
#include "mqtt_client.h"
//#include "http_parser.h"

int mqtt_global_stat;
void mqtt_init(const char* mqtt_server, int mqtt_port, const char* username, const char* pass);
int mqtt_publish(const char* topic, char* payload);
int mqtt_publish_iotera(char* payload);
int mqtt_subscribe(const char* topic);
int mqtt_conn_stat(void);
void mqtt_data_handling(esp_mqtt_event_handle_t event);
// payload
char sub_msg[16];

#endif
