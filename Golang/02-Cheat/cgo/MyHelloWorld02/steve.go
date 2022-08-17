package main

import "fmt"

// #include "steve.h"
import "C"

func main() {
	fmt.Println("stevepro beg")
	C.steve()
	fmt.Println("stevepro end")
}
