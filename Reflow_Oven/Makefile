.PHONY: clean build

FIRMWARE_SOURCE=reflow_oven.ino
FIRMWARE_BINARY=reflow_oven

build: 
	arduino-cli core install STM32:stm32
	arduino-cli compile -b STM32:stm32:Nucleo_64:pnum=NUCLEO_F103RB,upload_method=MassStorage,usb=none,opt=ogstd $(FIRMWARE_SOURCE) --build-path `realpath ./build` -o $(FIRMWARE_BINARY)

clean:
	rm -rf build *.elf *.bin
