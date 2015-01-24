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

char contrast_v[16];
char bright_v[16];

// generate a random string to print
rand_str(lcd_text,ARRAY_SIZE(lcd_text));

// set up the LCD screen
lcd_setup();

// clear the screen
lcd_clr_scr();


for (i=0;i<151;i+=50) {
  for (j=0;j<151;j+=50) {
  usleep(500000);
  sprintf(contrast_v,"Contrast: %d\0", i);
  sprintf(bright_v,"Brightness: %d\0", j);
  lcd_cursor_move(1,2);
  lcd_put_string(contrast_v);
  lcd_cursor_move(2,2);
  lcd_put_string(bright_v);
  lcd_contrast_write(i);
  lcd_brightness_write(j);
  }
  lcd_clr_scr();

}

lcd_contrast_write(110);
lcd_brightness_write(220);

// go through each LCD character and print a character
for (i=1;i<3;i++)
  for (j=1;j<17;j++) {
    usleep(250000);
    lcd_cursor_move(i,j);
    lcd_put_char(lcd_text[(i-1)*16+j-1]);     
  }

  
}
