package main

import "core:fmt"
import "core:os"
import "core:strconv"

main :: proc() {
	buf: [256]byte
	fmt.print("n: ")
	buf_len, err := os.read(os.stdin, buf[:])
	if err != nil {
		fmt.eprintln("Error reading: ", err)
		return
	}
	input := string(buf[:buf_len])

	n, ok := strconv.parse_int(input)

	result := n
	fmt.printf("Result: %v", result)
}
