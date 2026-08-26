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

	sum := 3 * n_sum(n / 3) + 5 * n_sum(n / 5) - 15 * n_sum(n / 15)
	fmt.printf("Result: %v", sum)
}

n_sum :: proc(n: int) -> int {
	return n * (n + 1) / 2
}
