package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {

	// get filenames for input
	args := os.Args[1:]
	{
		if len(args) == 0 || args[0] == "/help" {
			fmt.Println("Usage: filemaker <input file>")
		} else {
			// open up the file
			fmt.Println("How would you like to see this text?")
			fmt.Println("1: All caps")
			fmt.Println("2: Title Case")
			fmt.Println("3: lowercase")
			var option int

			_, err := fmt.Scanf("%d", &option)

			file, err := os.Open(args[0])
			if err != nil {
				fmt.Println(err)
			}
			defer file.Close()

			scanner := bufio.NewScanner(file)
			for scanner.Scan() {

				switch option {
				case 1:
					fmt.Println(strings.ToUpper(scanner.Text()))
				case 2:
					fmt.Println(strings.Title(scanner.Text()))
				case 3:
					fmt.Println(strings.ToLower(scanner.Text()))
				}
			}

			if err := scanner.Err(); err != nil {
				fmt.Println(err)
			}
		}
	}
}
