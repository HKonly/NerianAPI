#!/bin/bash

g++ source/imagetest.cpp -Wall -L./lib -I./include -lvisiontransfer -pthread -Wl,-rpath ./lib
