 #include <visiontransfer/deviceenumeration.h>
 #include <visiontransfer/asynctransfer.h>
 #include <visiontransfer/imageset.h>
 #include <iostream>
 #include <exception>
 #include <stdio.h>
  
 using namespace visiontransfer;
  
 int main() {
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
         // the first detected device
         AsyncTransfer asyncTransfer(devices[0]);
  
         // Receive 100 images
         for(int i=0; i<100; i++) {
             std::cout << "Receiving image set " << i << std::endl;
  
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
                 snprintf(fileName, sizeof(fileName), "image%03d_%d.pgm", i,
                     imageNumber);
  
                 imageSet.writePgmFile(imageNumber, fileName);
             }
         }
     } catch(const std::exception& ex) {
         std::cerr << "Exception occurred: " << ex.what() << std::endl;
     }
  
     return 0;
 }
