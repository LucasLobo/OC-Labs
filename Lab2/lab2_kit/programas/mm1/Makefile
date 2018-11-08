TARGETS = mm1
PAPILIB=/usr/lib/x86_64-linux-gnu/libpapi.so.5.6.0
CFLAGS=-O1

all: $(TARGETS)

mm1: mm1.c
	$(CC) $(CFLAGS) mm1.c $(PAPILIB) -o mm1

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
