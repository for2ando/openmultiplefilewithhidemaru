# Makefile for openmultiplefilewithhidemaru

INSTSHELLDIR=~/bin
INSTSHELLFILES=openmultiplefilewithhidemaru
INSTMACROFILES=multiplefile.mac
ALLFILES=$(INSTFILES) Makefile README.md

install: install-shellscript install-macro

install-shellscript: $(INSTSHELLFILES)
	install $^ $(INSTSHELLDIR)

install-macro: $(INSTMACROFILES)
	install --target-directory=$(shell cmd /c "reg query HKCU\Software\Hidemaruo\Hidemaru\Env /v MacroPath" | awk 'NR==3{print $$3}' | cygpath -u -f -) $^

diff: $(ALLFILES)
	$(foreach i,$^,diff -u $(INSTDIR)/$i $i;)
