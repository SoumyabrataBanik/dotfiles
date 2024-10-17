#!/bin/bash

RANDOM_NUMBER=$((1 + RANDOM % 100000))

# Take a screenshot using scrot with the specified arguments and save it to a file with the desired nomenclature
scrot -f -s -q 100 "~/Pictures/Screenshots/Screenshot_${RANDOM_NUMBER}.png"
