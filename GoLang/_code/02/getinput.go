package main

import (
	"fmt"
)

func main() {
	var name string
	fmt.Println("Name?")
	fmt.Scanf("%s", &name)
	fmt.Printf("Hello %s", name)
}
