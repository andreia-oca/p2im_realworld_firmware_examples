#!/bin/bash

# Check if the user requested a clean
if [[ $1 == "-c" ]];
then
	read -p "Do you really want to clean all the dependecies? [n]:" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; 
	then
		rm -rf gcc-arm-none-eabi
		# ./arduino-ide/uninstall.sh
		rm -rf arduino-ide
		rm -rf arduino-cli
	fi
	exit 0
fi	

# Install GNU ARM Compiler
# Official download link https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
read -p "Do you want to install GNU ARM Compiler? [n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; 
then
	wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2?revision=ca0cbf9c-9de2-491c-ac48-898b5bbc0443&la=en&hash=68760A8AE66026BCF99F05AC017A6A50C6FD832A" -O "gcc-arm-none-eabi.tar.bz2"
	tar xjf gcc-arm-none-eabi.tar.bz2 --transform 's/gcc-arm-none-eabi-10-2020-q4-major/gcc-arm-none-eabi/' 
	rm gcc-arm-none-eabi.tar.bz2
fi
unset REPLY

# Test command
which arm-none-eabi-cpp &> /dev/null
if [ $? -eq 0 ];
then
	echo "[+] gcc-arm-none-eabi installed correcly."
else 
	echo "[-] Something went wrong when installing gcc-arm-none-eabi." 
fi

# Install Arduino IDE
read -p "Do you want to install Arduino IDE? [n]:" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; 
then
	wget https://downloads.arduino.cc/arduino-1.8.13-linux64.tar.xz -O arduino-ide.tar.xz
	tar xf arduino-ide.tar.xz --transform 's/arduino-1.8.13/arduino-ide/'
	rm arduino-ide.tar.xz
	./arduino-ide/install.sh 

# Install Arduino libraries (if necessary)
# wget https://downloads.arduino.cc/libraries/github.com/firmata/Firmata-2.5.8.zip
# unzip Firmata-2.5.8.zip
# rm Firmata-2.5.8.zip
# mv Firmata-2.5.8 ~/Arduino/libraries/Firmata 
	git clone https://github.com/br3ttb/Arduino-PID-Library ~/Arduino/libraries/Arduino-PID-Library
	git clone https://github.com/rocketscream/MAX31855 ~/Arduino/libraries/MAX31855
	git clone https://github.com/adafruit/MAX6675-library ~/Arduino/libraries/MAX6675-library
fi
unset REPLY

# Install arduino-cli
# Official download link https://arduino.github.io/arduino-cli/latest/installation/
read -p "Do you want to install arduino-cli? [n]:" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; 
then
	wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz -O "arduino-cli.tar.gz"
	tar xf arduino-cli.tar.gz
	rm arduino-cli.tar.gz
	rm LICENSE.txt
	arduino-cli core update-index
	arduino-cli core install arduino:sam
	arduino-cli core install STM32:stm32
fi
unset REPLY

