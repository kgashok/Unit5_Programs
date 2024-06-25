ODIR = obj
IDIR = .
_DEPS = list.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

CFLAGS = -Wno-unused-result

objects = main \
  prog11 prog12 prog13 prog14 prog15 \
  prog21 prog22 trans \
  prog31 prog32 mycopy \
  prog71 prog72 prog73 \
  list list2 list3 testgen

_OBJ = main.o \
  prog11.o prog12.o prog13.o prog14.o prog15.o \
  prog21.o prog22.o trans.o \
  prog31.o prog32.o mycopy.o \
  prog71.o prog72.o prog73.o \
  list.o list2.o list3.o testgen.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

# Specify the directory for object files
$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

# Rule to link object files to create the executables
%: $(ODIR)/%.o
	$(CC) $(CFLAGS) -o $@ $<

all: $(objects)

clean:
	rm -f $(objects) $(OBJ)
