.PHONY: all clean

all:
	make -C Console
	make -C CNC
	make -C Gateway
	make -C Reflow_Oven
	make -C Heat_Press
	make -C PLC
	make -C Steering_Control

clean:
	make clean -C Console
	make clean -C CNC
	make clean -C Gateway
	make clean -C Reflow_Oven
	make clean -C Heat_Press
	make clean -C PLC
	make clean -C Steering_Control
