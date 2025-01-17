#!/bin/bash

rm -rf build
mkdir build 
cd build 
cmake .. 
make 
./lcm $1 $2
