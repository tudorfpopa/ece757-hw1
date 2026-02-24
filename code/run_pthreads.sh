#!/bin/bash

# clean and compile
rm -rf ./kymppitonni
gcc -o kymppitonni kymppitonni-pthreads.c -lpthread

RUNS=10

for THREADS in 2 3 4 5 6 7 8 9 10 11 12; do
    OUTPUT=./output_pthreads_${THREADS}.txt
    touch $OUTPUT
    TOTAL=0
    for i in $(seq 1 $RUNS); do
        RESULT=$(./kymppitonni 100000 10 300 $THREADS | grep "Execution time in cycles")
        CYCLES=$(echo $RESULT | grep -oP '\d+')
        TOTAL=$((TOTAL + CYCLES))
    done
    AVG=$((TOTAL / RUNS))
    echo "Threads: $THREADS, Average execution time: $AVG cycles" | tee $OUTPUT
done

# clean and move outputs
rm -rf ./kymppitonni
for THREADS in 2 3 4 5 6 7 8 9 10 11 12; do
    rm -rf ../outputs/output_pthreads_${THREADS}.txt
    mv ./output_pthreads_${THREADS}.txt ../outputs/output_pthreads_${THREADS}.txt
done
