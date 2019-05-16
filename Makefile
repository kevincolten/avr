# source files
TARGET	:= $(shell basename $(PWD))
CSRCS	:= $(wildcard *.c)
COBJS	:= $(CSRCS:.c=.o)
SSRCS	:= $(wildcard *.S)
SOBJS	:= $(SSRCS:.S=.o)
OBJS	:= $(COBJS) $(SOBJS)

LST	:= $(TARGET).lst

# define the processor here
MCU		:= atmega328p
FREQ	:= 16000000L

# define the USB port on your system
#PORT	:= /dev/ttyACM0
PORT	:= /dev/tty.usbmodem14101
PGMR	:= arduino

# tools
GCC		:= avr-gcc
OBJDUMP	:= avr-objdump
OBJCOPY	:= avr-objcopy
DUDE	:= avrdude

UFLAGS	:=  -v -D -p$(MCU) -c$(PGMR)
UFLAGS		+= -P$(PORT)
UFLAGS		+= -b115200

CFLAGS	:=  -c -Os -mmcu=$(MCU)
CFLAGS		+= -DF_CPU=$(FREQ) -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/ -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/standard


LFLAGS	+= -mmcu=$(MCU)
LFLAGS		+= -DF_CPU=$(FREQ) -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/ -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/standard


.PHONY all:
all:	$(TARGET).hex $(LST)

# implicit build rules
%.hex:	%.elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@

%.elf:	$(OBJS)
	$(GCC) $(LFLAGS) $(TARGET).o -o $@ $^

%.o:	%.cpp
	$(GCC) -c $(CFLAGS) -o $@ $^

%.o:	%.S
	$(GCC) -c $(CFLAGS) -o $@ $<

%.lst:	%.elf
	$(OBJDUMP) -C -d $< > $@

# utility targets
.PHONY:	load
load:
	$(DUDE) $(DUDECONF) $(UFLAGS) -Uflash:w:$(TARGET).hex:i

.PHONY:	clean
clean:
	$(RM) *.hex *.lst *.o *.elf