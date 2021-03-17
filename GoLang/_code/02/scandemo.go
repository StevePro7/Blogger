package main

import (
	"fmt"
)

func main() {

	var name string
	fmt.Println("What is your name?")
	test, _ := fmt.Scanf("%q", &name)

	switch test {
	case 0:
		fmt.Printf("You must enter a name!")
	case 1:
		fmt.Printf("Hello %s!", name)
	}
}
