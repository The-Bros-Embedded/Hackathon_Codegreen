/*
 *  uart_app.c file
 *
 * 	author	: Dadan
 * 	email	: dadanugm07@gmail.com
 * 	date	: 8/2/2021
 * 	revison	:
 *
*/

#include "uart_app.h"

/*
 *  uart fixed pin: uart0: 43(tx), 44(rx)
 *  				
 */

QueueHandle_t uart0_queue;

// event handling task
void uart0_event_task(void *pvParameters)
{
	uart_event_t u0_event;
	//uart0_evt_buff = malloc(BUFF_SIZE);
	while(1)
	{
		//Waiting for UART event
		if(xQueueReceive(uart0_queue, (void *)&u0_event, (portTickType)portMAX_DELAY))
		{
			bzero(uart0_evt_buff, BUFF_SIZE);
			switch(u0_event.type)
			{
				case UART_DATA:
					uart_read_bytes(UART_NUM_0, uart0_evt_buff, u0_event.size, portMAX_DELAY);
					//uart_write_bytes(UART_NUM_0, (const char*) uart0_evt_buff, u0_event.size);
					break;

				default:
					break;
			}
		}
	}
}


void uart0_init(int baud, uart_word_length_t databit, uart_hw_flowcontrol_t flowctrl, uart_parity_t parity,
		uart_stop_bits_t stopbits, uart_sclk_t clk_source)
{
	// change uart properties
	uart_config.baud_rate = baud;
	uart_config.data_bits = databit;
	uart_config.flow_ctrl = flowctrl;
	uart_config.parity = parity;
	uart_config.stop_bits = stopbits;
	uart_config.source_clk = clk_source;

	//
	uart_driver_install(UART_NUM_0,BUFF_SIZE,BUFF_SIZE,20,&uart0_queue,0);
	uart_param_config(UART_NUM_0,&uart_config);
	uart_set_pin(UART_NUM_0, UART0_TX, UART0_RX, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);

	xTaskCreate(uart0_event_task, "uart0_event_task", 2048, NULL, 12, NULL);
}

void uart0_write(char* data, int len)
{
	uart_write_bytes(UART_NUM_0,data,len);
}




