/*
 *  mqtt_app.c file
 *
 * 	author	: Dadan
 * 	email	: dadanugm07@gmail.com
 * 	date	: 8/2/2021
 * 	revison	:
 *
*/


/*
 * MQTT Global stat
 * 	0 -> mqtt error
 *	1 -> connected
 *	2 -> disconnected
 *	3 -> subscribed
 *	4 -> unsubscribed
 *	5 -> published
 *	6 -> Data
 *
 *
 *  return message_id of the publish message (for QoS 0 message_id will always be zero) on success.
 *         -1 on failure.
 */


#include "mqtt_app.h"

esp_mqtt_client_handle_t client;
static const char *TAG = "MQTT";
int msg_id;
char mqtt_serv[] = "192.168.1.7";

static esp_err_t mqtt_event_handler_cb(esp_mqtt_event_handle_t event)
{
    client = event->client;
    // your_context_t *context = event->context;
    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
		
            ESP_LOGI(TAG, "MQTT_EVENT_CONNECTED");
        /*    msg_id = esp_mqtt_client_publish(client, mqtt_online_topic, "Device restarted", 0, 1, 0);
            ESP_LOGI(TAG, "publish successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_subscribe(client, mqtt_subscribe_topic, 0);
            ESP_LOGI(TAG, "subscribe successful, msg_id=%d", msg_id);
		*/
            /*
            msg_id = esp_mqtt_client_subscribe(client, "/topic/qos1", 1);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_unsubscribe(client, "/topic/qos1");
            ESP_LOGI(TAG, "sent unsubscribe successful, msg_id=%d", msg_id);
            */
            mqtt_global_stat = 1;
            break;
        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_DISCONNECTED");
            mqtt_global_stat = 2;
            break;

        case MQTT_EVENT_SUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_SUBSCRIBED, msg_id=%d", event->msg_id);
            //msg_id = esp_mqtt_client_publish(client, "/topic/qos0", "data", 0, 0, 0);
            //ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);
            mqtt_global_stat = 3;
            break;
        case MQTT_EVENT_UNSUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_UNSUBSCRIBED, msg_id=%d", event->msg_id);
            mqtt_global_stat = 4;
            break;
        case MQTT_EVENT_PUBLISHED:
            ESP_LOGI(TAG, "MQTT_EVENT_PUBLISHED, msg_id=%d", event->msg_id);
            mqtt_global_stat = 5;
            break;
        case MQTT_EVENT_DATA:
            ESP_LOGI(TAG, "MQTT_EVENT_DATA");
            mqtt_data_handling(event);
            mqtt_global_stat = 6;
            break;
        case MQTT_EVENT_ERROR:
            ESP_LOGI(TAG, "MQTT_EVENT_ERROR");
            mqtt_global_stat = 0;
            break;
        default:
            ESP_LOGI(TAG, "Other event id:%d", event->event_id);
            break;
    }

    return ESP_OK;
}


static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data) {
    ESP_LOGD(TAG, "Event dispatched from event loop base=%s, event_id=%d", base, event_id);
    mqtt_event_handler_cb(event_data);
}


void mqtt_init(const char* mqtt_server, int mqtt_port, const char* username, const char* pass)
{
    ESP_LOGI(TAG, "[APP] Startup..");
    ESP_LOGI(TAG, "[APP] Free memory: %d bytes", esp_get_free_heap_size());
    ESP_LOGI(TAG, "[APP] IDF version: %s", esp_get_idf_version());
    
    esp_log_level_set("*", ESP_LOG_INFO);
    esp_log_level_set("MQTT_CLIENT", ESP_LOG_VERBOSE);
    esp_log_level_set("MQTT_EXAMPLE", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_TCP", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_SSL", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT", ESP_LOG_VERBOSE);
    esp_log_level_set("OUTBOX", ESP_LOG_VERBOSE);

    printf("init mqtt flash & netif\r\n");
    ESP_ERROR_CHECK(nvs_flash_init());
    ESP_ERROR_CHECK(esp_netif_init());
    //ESP_ERROR_CHECK(esp_event_loop_create_default());
    printf("init mqtt\r\n");

    esp_mqtt_client_config_t mqtt_cfg = {
    		.uri = mqtt_server,
    		.port = mqtt_port,
    		.username = username,
    		.password = pass
    };

    //printf("LW_topic: %s\r\n",mqtt_cfg.lwt_topic);

    esp_mqtt_client_handle_t client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_register_event(client, ESP_EVENT_ANY_ID, mqtt_event_handler, client);
    esp_mqtt_client_start(client);
}

/*
 *
 * APPLICATION FOR MQTT
 *
 *
 */
int mqtt_publish(const char* topic, char* payload)
{
	int pub_stat = 0;
	if ((mqtt_global_stat != 0) && (mqtt_global_stat != 2)){
		// publish payload
		pub_stat = esp_mqtt_client_publish(client,topic,payload,0, 1, 0);
	}

	return pub_stat;
}

int mqtt_subscribe(const char* topic)
{
	int stat = 0;
	if ((mqtt_global_stat != 0) && (mqtt_global_stat != 2)) {
		// publish payload
		stat = esp_mqtt_client_subscribe(client,topic,0);
	}
	return stat;
}

int mqtt_conn_stat(void)
{
	int stat;
	esp_err_t status = ESP_OK;
	if (mqtt_global_stat == 2){
		status = esp_mqtt_client_reconnect(client);
	}
	if(status == ESP_OK){
		stat = 0;
		//printf("connected to server\r\n");
	}
	else {
		//printf("disconnected from server\r\n");
		stat = -1;}

	return stat;
}

void mqtt_data_handling(esp_mqtt_event_handle_t data_event)
{
	//int len_str;
	bzero(sub_msg,sizeof(sub_msg));
    printf("TOPIC=%.*s\r\n", data_event->topic_len, data_event->topic);
    printf("DATA=%.*s\r\n", data_event->data_len, data_event->data);
    strcpy(sub_msg,data_event->data);
    //len_str = strcmp(sub_msg,"testing");
    printf("sub msg: %s\r\n",sub_msg);
}

//EOF

