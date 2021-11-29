/*
 *  uart_app.h file
 *
 * 	author	: Dadan
 * 	email	: dadanugm07@gmail.com
 * 	date	: 8/2/2021
 * 	revison	:
 *
*/


#ifndef __UART_APP_H
#define __UART_APP_H

#include <stdio.h>
#include <string.h>
#include "driver/uart.h"

#define BUFF_SIZE 	1024
#define UART0_TX	21
#define UART0_RX	20

uart_config_t uart_config;
uint8_t uart0_evt_buff[BUFF_SIZE];

void uart0_init(int baud, uart_word_length_t databit, uart_hw_flowcontrol_t flowctrl, uart_parity_t parity,
		uart_stop_bits_t stopbits, uart_sclk_t clk_source);
void uart0_write(char* data, int len);

#endif
