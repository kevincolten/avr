# source files
# required object files
COBJS	:= $(CSRCS:.c=.o)
CXXOBJS	:= $(CXXSRCS:.cpp=.o)
SOBJS	:= $(SSRCS:.S=.o)
OBJS	:= $(COBJS) $(CXXOBJS) $(SOBJS)
LST		:= $(TARGET).lst