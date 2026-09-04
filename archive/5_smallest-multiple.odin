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
	result := 1

	mults: [dynamic]int
	for i := 2; i <= n; i += 1 {
		if result % i == 0 {
			continue
		}

		new := i
		for mult in mults {
			if new % mult == 0 {
				new /= mult
			}
		}

		result *= new
		append(&mults, new)
	}

	fmt.printf("Result: %v", result)
}
