#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/asynctransfer.h>
#include <visiontransfer/imageset.h>
#include <stdio.h>
#include <exception>

using namespace visiontransfer;

int main() {
    try {
        DeviceEnumeration deviceEnum;
        DeviceEnumeration::DeviceList devices = deviceEnum.discoverDevices();

        if (devices.size() == 0) {
            printf("No devices discovered!\n");
            return -1;
        }

        printf("List of discovered devices: \n");
        for (unsigned int i=0; i<devices.size(); i++) {
            printf("[%2d]: %s\n", i+1, devices[i].toString().c_str());
        }
        printf("\n");

        AsyncTransfer asyncTransfer(devices[0]);

        ImageSet imageSet;
        printf("Receiving an image\n");

        while(!asyncTransfer.collectReceivedImageSet(imageSet, 0.1));

        int sec, nsec;
        imageSet.getTimestamp(sec, nsec);

        unsigned char* pixels;
        if (imageSet.getNumberOfImages() > 0) {
            pixels = imageSet.getPixelData(imageSet.IMAGE_LEFT);
            printf("image size: %ld\n", sizeof(pixels));
        }
    } catch(const std::exception& ex) {
        printf("Exception occurred: %s\n", ex.what());
    }
    return 0;
}
