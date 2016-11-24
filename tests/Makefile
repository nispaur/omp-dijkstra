# Makefile de test

# FIXME: hériter des variables du makefile parent ?
SEQBIN := ../dijkstra_seq2
OMPBIN := ../dijkstra_omp
TESTS := simple rome99 new-york

# Génère les fichiers de référence pour comparaison
%.cmp: %.gr $(SEQBIN)
	@(echo "Génération de la sortie test du graphe $%")
	$(SEQBIN) $< 2>/dev/null > $@

# Générère les sorties de référénce en séquentiel (long)
all-tests: $(SEQBIN) *.cmp 

# Test du programme OpenMP contre le jeu de test
check-%: %.gr %.cmp $(SEQBIN) $(OMPBIN)
	@$(OMPBIN) $< 2>/dev/null | diff $(word 2,$^) -
	@(echo "Vérification programme openmp: graphe $* ok !")

# Pour ceux qui ont du temps à perdre
check-all: $(addprefix check-, $(TESTS))
