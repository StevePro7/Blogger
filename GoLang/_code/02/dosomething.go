package main

import (
	"os"
	"strconv"
)

func main() {

	args := os.Args[1:]

	total, _ := strconv.ParseFloat(args[0], 32)
	tip, _ := strconv.ParseFloat(args[1], 32)
	calcVal(float32(total), float32(tip))
}

func calcVal(total float32, tip float32) float32 {
	price := total * (total * (tip / 100))
	return price
}
