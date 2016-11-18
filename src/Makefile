# Basic makefile

CC = gcc 
CFLAGS = -std=c99 -Wall -pedantic -I.
LINKER = $(CC) -o
# linking flags here
LFLAGS = -Wall -I. -lm
DEPS = 
OBJ = dijkstra_seq2.o

RM = rm -f
GRAPHDIR = ../testfiles/
GRAPHFILES = 1 rome99 new-york
# Binaire utilisé pour faire les tests, actuellement le seq2
TARGETBIN = seq2 


%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

# Version Sequentielle
seq2: $(OBJ)
	$(LINKER) $@ $^ $(LFLAGS)

# Jeu de tests
test-%: $(TARGETBIN)
	./$(TARGETBIN) $(GRAPHDIR)/$@.gr

testall: $(addprefix test-, $(GRAPHFILES))
	@echo "Test de $@"

.PHONY: clean
clean:
	$(RM) $(OBJ) $(TARGETBIN)
	@echo "Nettoyage fait !"

