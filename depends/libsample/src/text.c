#include <stdlib.h>
#include <stdio.h>
#include "common/versions.h" //common file for the whole project
#include "sample/text.h"

int stringToInt(const char* str)
{
    if (str)
        return atol(str);
    else
        return -1;
}

void intToString(int val, char* str)
{
    snprintf(str, 12, "%d", val); //MAX: 2147483647
}