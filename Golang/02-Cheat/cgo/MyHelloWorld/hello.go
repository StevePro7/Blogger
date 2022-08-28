package main

import "fmt"

// #include "hello.h"
import "C"

func main() {
	fmt.Println("begin")
	C.hello()
	fmt.Println("-end-")
}
