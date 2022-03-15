#include <visiontransfer/deviceenumeration.h>
#include <visiontransfer/asynctransfer.h>
#include <visiontransfer/imageset.h>
#include <visiontransfer/imageprotocol.h>
#include <cstring>
#include <stdio.h>
#include <exception>
#include <fstream>
#include <chrono>

using namespace std;
using namespace visiontransfer;
using namespace chrono;

int main() {
    system_clock::time_point start;
    system_clock::time_point end;

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

        AsyncTransfer asyncTransfer("192.168.10.10", "7681", ImageProtocol::PROTOCOL_UDP);

        int sec, nsec, psec, pnsec, secd, nsecd;
        for (int imageIdx=0; imageIdx<100; imageIdx++) {
            ImageSet imageSet;
            printf("Receiving image %2d    ", imageIdx+1);
            while(true) {
                if (asyncTransfer.collectReceivedImageSet(imageSet, 0.005)) {
                    int num_images = imageSet.getNumberOfImages();
                    printf("Number of Images: %d\n", num_images);
                    start = system_clock::now();
        
                    imageSet.getTimestamp(sec, nsec);
                    if (imageIdx==0) {
                        psec = sec; secd = 0;
                        pnsec = nsec; nsecd = 0;
                    }
                    else {
                        if (sec == psec) {
                            secd = 0;
                            nsecd = nsec - pnsec;
                        }
                        else {
                            if (nsec > pnsec) {
                                secd = sec - psec;
                                nsecd = nsec - pnsec;
                            }
                            else {
                                secd = sec - psec - 1;
                                nsecd = nsec + 1000000 - pnsec;
                            }
                        }
                        psec = sec;
                        pnsec = nsec;
                    } 
        
                    printf("Delta Time: %d.%06d    ", secd, nsecd);
            
                    unsigned char* pixels;
                    int width, height, pixel_size, data_size;
                    if (imageSet.getNumberOfImages() > 0) {
                        pixels = imageSet.getPixelData(ImageSet::IMAGE_LEFT);
                        pixel_size = imageSet.getBytesPerPixel(ImageSet::IMAGE_LEFT);
                        height = imageSet.getHeight();
                        width = imageSet.getWidth();
            
                        data_size = height * width * pixel_size;
            
//                        printf("Bytes per pixel: %d\n", pixel_size);
//                        printf("image width: %d // image height: %d\n", width, height);
//                        printf("image size: %d\n\n", data_size);
//            
//                        printf("Saving an image...");
//                        char imageStore[data_size+8];
//                        copy(&sec, &sec+4, imageStore);
//                        copy(&nsec, &nsec+4, imageStore+4);
//                        copy(pixels, pixels+data_size, imageStore+8);
            
                        ofstream writeFile;
                        writeFile.open("testfile", ios_base::app | ios::binary);
                        writeFile.write((char*)&sec, 4);
                        writeFile.write((char*)&nsec, 4);
                        writeFile.write((char*)pixels, data_size);
//                        writeFile.write(imageStore, 3735560);
                        writeFile.close();
                    }
                    end = system_clock::now();
                    int elapsed = (end - start).count();
                    printf("Time elapsed: %2.8f\n", ((float)elapsed / 1000000000.0));
                    break;
                }
            }
        }
    } catch(const std::exception& ex) {
        printf("Exception occurred: %s\n", ex.what());
    }
    return 0;
}
