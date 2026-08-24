package main

import "core:fmt"
import "core:os"
import "core:strconv"

main :: proc() {
	buf: [256]byte
	fmt.print("n: ")
	n, err := os.read(os.stdin, buf[:])
	if err != nil {
		fmt.eprintln("Error reading: ", err)
		return
	}
	str := string(buf[:n])

	x, ok := strconv.parse_int(str)

	sum := (4 * (x * x * x) - x) / 3
	fmt.printf("First %i odd squares sum is %i", x, sum)
}
