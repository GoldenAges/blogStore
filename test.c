#include <stdio.h>
#include <string.h>
#define MAXINPUT 1000

int main(void) {
   char str[] = "11011,11101,10011";
   char delims[] = ",";
   char *num1[MAXINPUT];
   char *result = NULL;
   result = strtok( str, delims );
   int i = 0;
   while( result != NULL ) {
       num1[i] = result;
       ++i;
       printf( "result is \"%s\"\n", result );
       result = strtok( NULL, delims );
   }

   for (int i = 0; i < 10; ++i)
   {
        
       for (int j = 0; i < 5; ++j)
       {
           
       }
   }

}
