CC=g++

CFLAGS=-c -g -Wall `root-config --cflags`

LDFLAGS=`root-config --glibs`

all: write_ROOT_file read_ROOT_file fill_histogram

write_ROOT_file: write_ROOT_file.cc
	$(CC) $(CFLAGS) -o write_ROOT_file.o write_ROOT_file.cc
	$(CC) -o write_ROOT_file write_ROOT_file.o $(LDFLAGS)

read_ROOT_file: read_ROOT_file.cc
	$(CC) $(CFLAGS) -o read_ROOT_file.o read_ROOT_file.cc
	$(CC) -o read_ROOT_file read_ROOT_file.o $(LDFLAGS)

fill_histogram: fill_histogram.cc
	$(CC) $(CFLAGS) -o fill_histogram.o fill_histogram.cc
	$(CC) -o fill_histogram fill_histogram.o $(LDFLAGS)

clean:
	rm -f ./*~ ./*.o ./write_ROOT_file
	rm -f ./*~ ./*.o ./read_ROOT_file
	rm -f ./*~ ./*.o ./fill_histogram
