build:
	version=`git rev-parse --short HEAD`;\
	for i in `ls -d */ | cut -f1 -d'/'`;\
	do echo kruppel/$$i:$$version && cd $$i && docker build -t kruppel/$$i:$$version .;\
	done

.PHONY: build
