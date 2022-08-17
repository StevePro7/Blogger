package main

import "fmt"

// #include "hello.h"
import "C"

func main() {
	fmt.Println("beg")
	C.hello()
	fmt.Println("end")
}
