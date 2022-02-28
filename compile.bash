#!/bin/bash

g++ imutime_bug.cpp -Wall -L./libvisiontransfer/lib -I./libvisiontransfer -lvisiontransfer -pthread -Wl,-rpath ./libvisiontransfer/lib
