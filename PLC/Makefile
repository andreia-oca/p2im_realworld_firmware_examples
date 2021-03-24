.PHONY: clean build

FIRMWARE_SOURCE=modbus.ino
FIRMWARE_BINARY=plc

build: 
	arduino-cli core install STM32:stm32
	arduino-cli compile -b STM32:stm32:Nucleo_144:pnum=NUCLEO_F429ZI,upload_method=MassStorage,usb=none,opt=ogstd $(FIRMWARE_SOURCE) --build-path `realpath ./build` -o $(FIRMWARE_BINARY)

clean:
	rm -rf build *.elf *.bin
