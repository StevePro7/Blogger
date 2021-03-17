package main

import (
	"bufio"
	"fmt"
	"os"
	"runtime"
)

func main() {

	reader := bufio.NewReader(os.Stdin)
	fmt.Println("Name?")
	text, _ := reader.ReadString('\n')
	fmt.Println("Hello %v", text)
	fmt.Printf("Go %v running %s", runtime.Version(), runtime.GOOS)

}
