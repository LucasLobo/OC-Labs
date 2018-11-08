TARGETS = mm2
PAPILIB=/usr/lib/x86_64-linux-gnu/libpapi.so.5.6.0
CFLAGS=-O1

all: $(TARGETS)

mm2: mm2.c
	$(CC) $(CFLAGS) mm2.c $(PAPILIB) -o mm2

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
