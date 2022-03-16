#!/bin/bash

g++ source/async_img_to_bin.cpp -o exes/async.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
g++ source/sync_img_to_bin.cpp -o exes/sync.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
g++ source/imagetest.cpp -o exes/savetest.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
