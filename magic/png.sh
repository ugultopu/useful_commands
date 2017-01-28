#!/bin/bash

PNG="137 80 78 71 13 10 26 10"

for number in $PNG; do
	hex=$hex$(printf "%02x" $number)
done

echo "$hex" | xxd -r -p > png

