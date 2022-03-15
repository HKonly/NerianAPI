#!/bin/bash

g++ source/async_img_to_bin.cpp -o async.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
g++ source/sync_img_to_bin.cpp -o sync.out -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
