//
// header file for using a bitwizard.nl rpi_ui board in SPI mode
//

#include <wiringPiSPI.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define ARRAY_SIZE(array) sizeof(array)/sizeof(array[0])
#define DEBUG 0
// CHANGEME: change the rpi_ui SPI address below with your board's address
#define LCD 0x94
// CHANGEME: defaulting to SPI port 0, change it if you're using SPI port 1
#define CHAN 0


void lcd_setup() {
int speed=50000;
if( wiringPiSPISetup(CHAN, speed) == -1) {
  printf("Could not initialise SPI on channel %d\n at speed %d",CHAN,speed);
  return;
}

}

void lcd_brightness_write(unsigned char brightness) {
unsigned char cmd[] = {LCD,0x13,brightness};
if (DEBUG & 1) {
  printf("Setting LCD brightness\t %02X\n",brightness);
  }
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
}

char lcd_brightness_read() {
unsigned char cmd[] = {LCD|1,0x13,0};
if (DEBUG & 1) {
  printf("Getting LCD brightness\t ");
  } 
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
printf("%02X\n", cmd[2] | (cmd[3] << 8));
return(cmd[2] | (cmd[3] << 8));
}

void lcd_contrast_write(unsigned char contrast) {
unsigned char cmd[] = {LCD,0x12,contrast};
if (DEBUG & 1) {
  printf("Setting LCD contrast\t %02X\n",contrast);
  }
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
}

char lcd_contrast_read() {
unsigned char cmd[] = {LCD|1,0x12,0};
if (DEBUG & 1) {
  printf("Getting LCD contrast\t ");
  } 
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
printf("%02X\n", cmd[2] | (cmd[3] << 8));
return(cmd[2] | (cmd[3] << 8));
}

void lcd_cursor_move(char line, char column) {
if ((line != 1) && (line != 2)) {
  line = 1;
  if (DEBUG & 1) 
    printf("Line should be 1 or 2, setting to 1\n");
  }
if ((column>16) || (column <1)) {
  column = 1;
  if (DEBUG & 1) 
    printf("Column should be between 1 and 16, setting to 1\n");
  }
char pos_val = (line - 1) << 5 | (column - 1);
unsigned char cmd[] = {LCD,0x11,pos_val};
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
}

void lcd_put_char(char c) {
unsigned char cmd[] = {LCD,0x00,c};
if (DEBUG & 1) {
  printf("Writing char\t %02X\n",c);
  } 
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
}

void lcd_clr_src() {
unsigned char cmd[] = {LCD,0x10,0x00};
if (DEBUG & 1) {
  printf("Clearing screen\n");
  } 
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(cmd));
}

void lcd_put_string(char *c) {
printf("%s %d\n",c,ARRAY_SIZE(c));
unsigned char cmd[] = {LCD,0x00};
int i;
char *p = malloc(sizeof(char) * (ARRAY_SIZE(c) + 2));
memcpy(p,cmd,2 * sizeof(char));
memcpy(p + 2 * sizeof(char),c,ARRAY_SIZE(c));

printf("Array: ");
for (i=0;i<ARRAY_SIZE(p);i++)
  printf("%02X ",p[i]);
printf(" end\n");

if (DEBUG & 1) {
  printf("Writing string\t %s\n",p);
  } 
wiringPiSPIDataRW(CHAN,cmd,ARRAY_SIZE(p));
}

