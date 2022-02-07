#include <boost/smart_ptr.hpp>
#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/datachannelservice.h>
#include <visiontransfer/asynctransfer.h>
#include <visiontransfer/imageset.h>
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

    printf("Creating Transfer\n");
    AsyncTransfer transfer(devices[0]);

    std::string addr = transfer.getRemoteAddress();
    printf("%s ", addr.c_str());
    printf(transfer.isConnected() ? "Connected\n" : "Not connected\n");

    usleep(250000);
    if(!service.imuAvailable()) {
        printf("Can't reach to camera's information!\n");
        return -1;
    }

    int ssec=0, susec=0;
    int isec=0, iusec=0;
    printf("Operation start\n");
    while(true) {
        ImageSet image;
        transfer.collectReceivedImageSet(image, 0.005);
        printf("Number of Image: %d\n", image.getNumberOfImages());
        image.getTimestamp(isec, iusec);
        
        TimestampedVector lin = service.imuGetLinearAcceleration();
        lin.getTimestamp(ssec, susec);
    
        printf("[sensor] sec: %10d / usec: %10d  //  [image] sec: %10d / usec: %10d\n", ssec, susec, isec, iusec);
        usleep(1000000);
    }
}
