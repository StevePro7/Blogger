package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {

	// endless loop terminated by /quit
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		if scanner.Text() == "/quit" {
			fmt.Println("Quitting")
			break
		} else {
			fmt.Println("You types " + scanner.Text())
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Println(err)
	}

	// our clone of the cat program
	file, err := os.Open("test.txt")
	if err != nil {
		fmt.Println(err)
	}

	defer file.Close()

	scanner2 := bufio.NewScanner(file)
	for scanner2.Scan() {
		fmt.Println(scanner2.Text())
	}

	if err := scanner.Err()(); err != nil {
		fmt.Println(err)
	}

}
