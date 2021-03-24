.PHONY: clean build

FIRMWARE_SOURCE=car_controller.ino
FIRMWARE_BINARY=steering_control

build: 
	arduino-cli core install arduino:sam
	arduino-cli compile -b arduino:sam:arduino_due_x_dbg $(FIRMWARE_SOURCE)  --build-path `realpath ./build` -o $(FIRMWARE_BINARY)

clean:
	rm -rf build *.elf *.bin
