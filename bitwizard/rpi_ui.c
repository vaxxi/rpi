#include <rpi_ui.h>

void main() {

int i=0,j=0;

// set up the LCD screen
lcd_setup();

// clear the screen
lcd_clr_src();

// change brightness two times, sleep 2 seconds in between
lcd_brightness_write(25);
sleep(2);
lcd_brightness_write(50);
sleep(2);
// change contrast two times, sleep 2 seconds in between
lcd_contrast_write(25);
sleep(2);
lcd_contrast_write(50);
sleep(2);

// go through each LCD character and print a character
for (i=1;i<3;i++)
  for (j=1;j<17;j++) {
    sleep(1);
    lcd_cursor_move(i,j);
    lcd_put_char('*');
  }
  
}
