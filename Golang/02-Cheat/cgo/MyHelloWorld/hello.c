#include "hello.h"

void hello()
{
    printf("%s\n", "Hello CGO!!");
    fprintf(stderr, "%s\n", "Hello there CGO!!");
}