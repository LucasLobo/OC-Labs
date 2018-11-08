TARGETS = mm3
PAPILIB=/usr/lib/x86_64-linux-gnu/libpapi.so.5.6.0
CFLAGS=-O1

all: $(TARGETS)

mm3: mm3.c
	$(CC) $(CFLAGS) mm3.c $(PAPILIB) -o mm3

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
