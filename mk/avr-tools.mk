# tools - these should be able to run on command line
GCC		:= /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc -DARDUINO=10809 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics
GXX		:= /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++ -DARDUINO=10809 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics
OBJDUMP	:= /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-objdump
OBJCOPY	:= /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-objcopy
DUDE	:= /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude -C/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf

# /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10809 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino -I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/standard /var/folders/0m/5pc9ltt12sd96czxby3tlfr00000gn/T/arduino_build_94716/sketch/sketch_may15a.ino.cpp -o /var/folders/0m/5pc9ltt12sd96czxby3tlfr00000gn/T/arduino_build_94716/sketch/sketch_may15a.ino.cpp.o
