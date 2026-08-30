package main

import "core:fmt"
import "core:math"
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

	lastFactor := 2 if n % 2 == 0 else 1
	for n % 2 == 0 {
		n /= 2
	}

	factor := 3
	maxFactor := int(math.sqrt(f64(n)))
	for n > 1 && factor <= maxFactor {
		if n % factor != 0 {
			factor += 2
			continue
		}

		lastFactor = factor
		for n % factor == 0 {
			n /= factor
		}
	}

	result = lastFactor
	fmt.printf("Result: %v", result)
}
