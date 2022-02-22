.PHONY: repl test fmt lint c clean

all:
	clear
	@$(RM) -r _build
	dune build
	dune build @fmt --auto-promote
	dune runtest

repl:
	dune build ./REPL.exe && rlwrap _build/default/REPL.exe

test:
	dune runtest

c : clean
clean:
	@$(RM) -r _build

fmt:
	dune build @fmt --auto-promote

lint:
	dune build @lint --force

release:
	dune build --profile=release
	dune runtest --profile=release

