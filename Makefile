CACHE_DIR ?= '.caches'

build:
	set -e;\
	mkdir -p ${CACHE_DIR};\
	for i in `ls -d */ | cut -f1 -d'/'`; do \
	echo kruppel/$$i;\
	docker load -i ${CACHE_DIR}/$$i.tar | true;\
	cd $$i && docker build -t kruppel/$$i . && cd -;\
	docker save -o $$i.tar kruppel/$$i;\
	mv $$i.tar ${CACHE_DIR}/$$i.tar;\
	done

.PHONY: build
