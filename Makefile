.DEFAULT_GOAL := install

encrypt: bin/rollup
	@./bin/rollup

install: bin/bootstrap
	@./bin/bootstrap

push: encrypt
	@git add . && git commit && git push

generate: bin/gnerate_make
	@./bin/generate_make
