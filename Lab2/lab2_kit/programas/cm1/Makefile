TARGETS = cm1 
PAPILIB=/usr/lib/x86_64-linux-gnu/libpapi.so.5.6.0

all: $(TARGETS)

cm1: cm1.c
	$(CC) $(CFLAGS) cm1.c $(PAPILIB) -o cm1

clean:
	rm -f $(TARGETS) *.o *.stderr *.stdout core *~
	rm *.out *.dat
	touch cm1_plot.dat
