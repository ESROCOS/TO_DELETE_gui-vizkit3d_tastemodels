#!/bin/bash

./make-links.sh
taskset -c 0 ./binary.c/binaries/x86_partition &

