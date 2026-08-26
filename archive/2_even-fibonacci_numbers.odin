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
	result := 0

	pprev := 2
	prev := 8
	result += 10
	for current := 4 * prev + pprev; current < n; current = 4 * prev + pprev {
		result += current
		pprev = prev
		prev = current
	}

	fmt.printf("Result: %v", result)
}
