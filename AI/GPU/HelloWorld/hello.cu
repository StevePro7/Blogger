#include <stdio.h>

__global__ void hello()
{
    printf("Hello from GPU! block=%d thread=%d\n",
           blockIdx.x, threadIdx.x);
}

int main() 
{
    hello<<<2, 4>>>();
    cudaDeviceSynchronize();
    return 0;
}

