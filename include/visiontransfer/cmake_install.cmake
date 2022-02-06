# Install script for directory: /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/lib/libvisiontransfer.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvisiontransfer.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/lib/libvisiontransfer-static.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/visiontransfer" TYPE FILE FILES
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/asynctransfer.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/imageprotocol.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/imagetransfer.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/common.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/reconstruct3d.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/reconstruct3d-pcl.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/reconstruct3d-open3d.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/alignedallocator.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/datablockprotocol.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/imageset.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/imageset-opencv.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/imagepair.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/bitconversions.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/datachannelservicebase.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/datachannelservice.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/datachannel-imu-bno080.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/protocol-sh2-imu-bno080.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/deviceinfo.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/deviceenumeration.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/internalinformation.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/parameterinfo.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/parametertransfer.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/parametertransferdata.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/deviceparameters.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/scenescanparameters.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/standardparameterids.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/networking.h"
    "/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/visiontransfer/sensorringbuffer.h"
    )
endif()

