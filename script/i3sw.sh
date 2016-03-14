#!/bin/sh

for i in $(seq 10); do
    i3 "workspace $i; move workspace to output right"
done
i3 "workspace 1"

