# Firmata library 2.5.8 needed
# In Firmata.h change the following line of code 
# `friend void FirmataMarshaller::encodeByteStream (size_t bytec, uint8_t * bytev, size_t max_bytes = 0) const` to
# `friend void FirmataMarshaller::encodeByteStream (size_t bytec, uint8_t * bytev, size_t max_bytes) const;`

.PHONY: clean build

FIRMWARE_SOURCE=StandardFirmata.ino
FIRMWARE_BINARY=gateway

build: 
	arduino-cli core install STM32:stm32
	arduino-cli compile -b STM32:stm32:Nucleo_64:pnum=NUCLEO_F103RB,upload_method=MassStorage,usb=none,opt=ogstd $(FIRMWARE_SOURCE) --build-path `realpath ./build` -o $(FIRMWARE_BINARY)

clean:
	rm -rf build *.elf *.bin
