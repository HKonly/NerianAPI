#!/bin/bash

mkdir out
mkdir save_images

g++ source/async_img_to_bin.cpp -o out/async.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
g++ source/sync_img_to_bin.cpp -o out/sync.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
g++ source/imagetest.cpp -o out/savetest.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
