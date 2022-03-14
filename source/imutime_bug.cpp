#include <boost/smart_ptr.hpp>
#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/datachannelservice.h>
#include <unistd.h>
#include <cstring>

int main() {
    printf("Searching camera device\n");

    // Search for camera
    DeviceEnumeration deviceEnum;
    DeviceEnumeration::DeviceList devices = deviceEnum.discoverDevices();
    if (devices.size() == 0) {
        printf("Can't find camera device!\n");
        return -1;
    }

    printf("%ld devices has found.\n", devices.size());

    printf("Creating Channel Service\n");
    DataChannelService service(devices[0]);

    usleep(250000);
    if(!service.imuAvailable()) {
        printf("Can't reach to camera's information!\n");
        return -1;
    }

    int sec=0, usec=0;
    while(true) {
        TimestampedVector lin = service.imuGetLinearAcceleration();
        lin.getTimestamp(sec, usec);
        printf("[IMU timestamp] sec(hex): %10d (%8x) / usec(hex): %10d (%8x)\n", sec, sec, usec, usec);
        if (sec < 0) { break; }
        usleep(500000);
    }
}
