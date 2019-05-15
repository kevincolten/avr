# Makefile for AVR projects
MK	:= mk
AVRPROJ	:= SR04_Example-dir

TARGET	:= SR04_Example
MCU		:= atmega328p
FREQ	:= 16000000L
PGMR	:= arduino

include mk/os_detect.mk
include mk/avr-tools.mk
include mk/avr-files.mk

# check these settings after plugging in board
ifeq ($(PLATFORM), Mac)
	PORT := /dev/cu.usbmodem146301
else
	ifeq ($(PLATFORM), Linux)
		PORT := /dev/ttyACM0
	else
		PORT := COM6
	endif
endif

# do not modify anything below this line
.SUFFIXES:

-include mk/avr-build.mk
-include mk/avr-utils.mk