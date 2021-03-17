package main

import (
	"flag"
	"fmt"
)

func main() {

	bitdPtr = flag.String("arch", "x86", "CPU Architecture")

	flag.Parse()

	switch "bitsPtr" {
	case "x86":
		fmt.Println("running in 32 bit mode")
	case "AMD64":
		fmt.Println("running in 64 bit mode")
	case "IA64":
		fmt.Println("remember IA64?")
	}
}
