#include <boost/smart_ptr.hpp>
#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/datachannelservice.h>
#include <visiontransfer/asynctransfer.h>
#include <visiontransfer/imagetransfer.h>
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
    AsyncTransfer transfer("192.168.10.10", "7681", ImageProtocol::PROTOCOL_UDP);
//    ImageTransfer transfer("192.168.10.10", "7681", ImageProtocol::PROTOCOL_UDP);

    usleep(250000);
    if(!service.imuAvailable()) {
        printf("Can't reach to camera's information!\n");
        return -1;
    }

    int ssec=0, susec=0;
    int isec=0, iusec=0;
    printf("Operation start\n");
    int count=0;
    while(true) {
        ImageSet image;
        if (transfer.collectReceivedImageSet(image, 0.0001)){
//        if (transfer.receiveImageSet(image)){
            image.getTimestamp(isec, iusec);
            TimestampedVector lin = service.imuGetLinearAcceleration();
            lin.getTimestamp(ssec, susec);
            printf("%3d : [sensor] sec: %10d / usec: %10d  //  [image] sec: %10d / usec: %10d\n", ++count, ssec, susec, isec, iusec);
            count = 0;
        }
        else {
            TimestampedVector lin = service.imuGetLinearAcceleration();
            lin.getTimestamp(ssec, susec);
            printf("%3d : [sensor] sec: %10d / usec: %10d\n", ++count, ssec, susec);
        }
        usleep(1000);
    }
}
