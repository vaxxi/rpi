#include <rpi_ui.h>


// random string generator
// credit: http://stackoverflow.com/questions/15767691/whats-the-c-library-function-to-generate-random-string

void rand_str(char *dest, size_t length) {
  char charset[] = "0123456789"
    "abcdefghijklmnopqrstuvwxyz"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "!@#$%^&*()_+";

while (length-- > 0) {
  size_t index = (double) rand() / RAND_MAX * (sizeof charset - 1);
  *dest++ = charset[index];
  }
  *dest = '\0';
}
                

void main() {

int i=0,j=0;
char lcd_text[32];
char middle_text[14]="Lily was here";

// generate a random string to print
rand_str(lcd_text,ARRAY_SIZE(lcd_text));

// set up the LCD screen
lcd_setup();

// clear the screen
lcd_clr_src();

// change brightness two times, sleep 2 seconds in between
lcd_brightness_write(25);
sleep(1);
lcd_brightness_write(50);
sleep(1);
// change contrast two times, sleep 2 seconds in between
lcd_contrast_write(25);
sleep(1);
lcd_contrast_write(50);
sleep(1);

// go through each LCD character and print a character
for (i=1;i<3;i++)
  for (j=1;j<17;j++) {
    usleep(250000);
    lcd_cursor_move(i,j);
    lcd_put_char(lcd_text[(i-1)*16+j-1]);     
  }

lcd_clr_src();

lcd_cursor_move(2,2);
lcd_put_string(middle_text);
  
}
