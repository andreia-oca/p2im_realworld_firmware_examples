.PHONY: clean build

FIRMWARE_SOURCE=HeatPress.ino
FIRMWARE_BINARY=heat_press

build: 
	arduino-cli core install arduino:sam
	arduino-cli compile -b arduino:sam:arduino_due_x_dbg $(FIRMWARE_SOURCE)  --build-path `realpath ./build` -o $(FIRMWARE_BINARY)

clean:
	rm -rf build *.elf *.bin
