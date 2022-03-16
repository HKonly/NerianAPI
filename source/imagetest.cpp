#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/asynctransfer.h>
#include <visiontransfer/imageset.h>
#include <iostream>
#include <exception>
#include <stdio.h>
#include <chrono>
  
using namespace visiontransfer;
using namespace std;
using namespace chrono;
  
int main() {
    system_clock::time_point start, end;
    try {
        // Search for Nerian stereo devices
        DeviceEnumeration deviceEnum;
        DeviceEnumeration::DeviceList devices = deviceEnum.discoverDevices();
        if(devices.size() == 0) {
            printf("No devices discovered!\n");
            return -1;
        }
 
        // Print devices
        printf("Discovered devices:\n");
        for(unsigned int i = 0; i< devices.size(); i++) {
            printf("%s\n", devices[i].toString().c_str());
        }
        printf("\n");
 
        // Create an image transfer object that receives data from
        // the first detected device
        AsyncTransfer asyncTransfer(devices[0]);

        start = system_clock::now();
 
        // Receive 100 images
        for(int i=0; i<100; i++) {
            printf("Receiving image set %d\n", i);
 
            // Receive image
            ImageSet imageSet;
            while(!asyncTransfer.collectReceivedImageSet(imageSet,
                0.1 /*timeout*/)) {
                // Keep on trying until reception is successful
            }
 
            // Write all included images one after another
            for(int imageNumber = 0; imageNumber < imageSet.getNumberOfImages(); imageNumber++) {
                // Create PGM file
                char fileName[100];
                snprintf(fileName, sizeof(fileName), "save_images/image%03d_%d.pgm", i,
                    imageNumber);
 
                imageSet.writePgmFile(imageNumber, fileName);
            }
        }

        end = system_clock::now();
        chrono::milliseconds elapsed = chrono::duration_cast<chrono::milliseconds>(end - start);
        printf("Time elapsed: %ld\n", elapsed.count());
    } catch(const std::exception& ex) {
        cerr << "Exception occurred: " << ex.what() << endl;
    }
  
    return 0;
}
