# loader flags
UFLAGS	:=  -v -D -p$(MCU) -c$(PGMR)
UFLAGS		+= -P$(PORT)
UFLAGS		+= -b115200

# c compiler flags
CFLAGS	:=  -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/ -I /Applications/Arduino.app/Contents/Java//hardware/arduino/avr/variants/standard
CFLAGS	+= -c -Os -mmcu=$(MCU)
CFLAGS	+= -DF_CPU=$(FREQ)

# link flags
LFLAGS	:= -mmcu=$(MCU)
LFLAGS	+= -nostartfiles
LFLAGS  += -x c++  -MMD -c -Wall -DF_CPU=16000000L  -Wall  -Os
LFLAGS	+=  -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/ -I /Applications/Arduino.app/Contents/Java//hardware/arduino/avr/variants/standard


# build targets
.PHONY all:
all:	$(TARGET).hex $(LST)

# implicit build rules
%.hex:	%.elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@

%.elf:	$(OBJS)
	$(GCC) $(LFLAGS) -o $@ $^ ${TARGET}.cpp

%.o:	%.cpp
	$(GXX) -c $(CFLAGS) -o $@ $<

%.o:	%.c
	$(GCC) -c $(CFLAGS) -o $@ $<

%.o:	%.S
	$(GCC) -c $(CFLAGS) -o $@ $<

%.lst:	%.elf
	$(OBJDUMP) -C -d $< > $@