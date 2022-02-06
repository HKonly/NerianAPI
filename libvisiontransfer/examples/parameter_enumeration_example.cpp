/*******************************************************************************
 * Copyright (c) 2021 Nerian Vision GmbH
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *******************************************************************************/

#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/imagetransfer.h>
#include <visiontransfer/imageset.h>
#include <visiontransfer/deviceparameters.h>
#include <iostream>
#include <exception>
#include <iomanip>
#include <stdio.h>
#include <stdlib.h>

using namespace visiontransfer;

int main(int argc, const char** argv) {
    try {
        // Search for Nerian stereo devices
        DeviceEnumeration deviceEnum;

        DeviceEnumeration::DeviceList devices = deviceEnum.discoverDevices();
        if(devices.size() == 0) {
            std::cout << "No devices discovered!" << std::endl;
            return -1;
        }

        // Print devices
        std::cout << "Discovered devices:" << std::endl;
        for(unsigned int i = 0; i< devices.size(); i++) {
            std::cout << devices[i].toString() << std::endl;
        }
        std::cout << std::endl;

        // Create an image transfer object that receives data from
        // the first detected Nerian stereo device
        DeviceParameters parameters(devices[0]);

        // Output the current parameterization

        const int colW = 40;
        const int valueW = 8;
        std::cout << std::boolalpha << std::left;
        std::cout << "Server-side Parameter Enumeration" << std::endl;
        std::cout << "=================================" << std::endl << std::endl;
        std::map<std::string, ParameterInfo> all_params = parameters.getAllParameters();
        std::cout << "All " << all_params.size() << " parameters reported by server:" << std::endl;
        for (std::map<std::string, ParameterInfo>::iterator it = all_params.begin(); it != all_params.end(); ++it) {
            ParameterInfo& param = it->second;
            ParameterInfo::ParameterType t = param.getType();
            switch (t) {
                case ParameterInfo::TYPE_INT: {
                    std::cout << std::setw(colW) << (param.getName()+" (int)") << " = " << std::setw(valueW) << param.getValue<int>();
                    if (param.getMin<int>() != param.getMax<int>()) {
                        std::cout << " range " << param.getMin<int>() << "-" << param.getMax<int>();
                        if (param.getInc<int>() != 1) {
                            std::cout << ", increment " << param.getInc<int>();
                        }
                    }
                    std::cout << std::endl;
                    break;
                }
                case ParameterInfo::TYPE_BOOL: {
                    std::cout << std::setw(colW) << (param.getName() + " (bool)") << " = " << (param.getValue<bool>()?"true":"false") << std::endl;
                    break;
                }
                case ParameterInfo::TYPE_DOUBLE: {
                    std::cout << std::setw(colW) << (param.getName()+" (double)") << " = " << std::setw(valueW) << param.getValue<double>();
                    if (param.getMin<double>() != param.getMax<double>()) {
                        std::cout << " range " << param.getMin<double>() << "-" << param.getMax<double>();
                    }
                    std::cout << std::endl;
                    break;
                }
            }
        }
        std::cout << std::endl;

	// Setting an enumerated parameter
        if (argc > 1) {
            std::string argname(argv[1]);
            if (argc > 2) {
                double val = atof(argv[2]);
                std::cout << "Sending request to set " << argname << " to " << val << std::endl;
                parameters.setNamedParameter(argname, val);
            } else {
                std::cout << "Requesting single parameter " << argname << std::endl;
                std::cout << "-> cast as a double: " << parameters.getNamedParameter<double>(argname) << std::endl;
            }
        } else {
            std::cout << "You can launch this with a parameter name to get (and a value to set it)" << std::endl;
            std::cout << "  e.g. " << argv[0] << " operation_mode [2]" << std::endl;
        }

        return 0;
    } catch(const std::exception& ex) {
        std::cerr << "Exception occurred: " << ex.what() << std::endl;
    }

    return 0;
}

