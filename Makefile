SHELL = /bin/bash
.SUFFIXES:
.SUFFIXES: .c .o .gr .cmp .out

RM := rm -f

CFLAGS := -std=c99 -g -Wall -pedantic -fopenmp

objdir := obj
srcdir := src

_SRCS := dijkstra_seq2.c dijkstra_omp.c 
SRCS := $(patsubst %,$(SRCDIR)/%,$(_SRCS))

all: createdir dijkstra_omp dijkstra_seq2

dijkstra_%: $(objdir)/dijkstra_%.o 
	$(CC) $(CFLAGS) -o $@ $^

createdir:
	mkdir -p $(objdir)

$(objdir)/%.o: $(srcdir)/%.c | createdir
	$(COMPILE.c) -o $@ $< 
 
clean:
	$(RM) dijkstra_seq2 dijkstra_omp
	$(RM) -r $(objdir)
