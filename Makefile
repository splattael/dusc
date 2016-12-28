CRYSTAL_BIN ?= $(shell which crystal)
PREFIX ?= $(CURDIR)
BINDIR = $(PREFIX)/bin
BINARY = $(BINDIR)/dusc

all: test

build: setup
	$(CRYSTAL_BIN) build $(PREFIX)/dusc.cr -o $(BINARY)

build-release: setup
	$(CRYSTAL_BIN) build --release $(PREFIX)/dusc.cr --link-flags "-static" -o $(BINARY)

test: setup
	$(CRYSTAL_BIN) spec

setup:
	@shards check > /dev/null || shards update

update:
	shards update

.PHONY: clean
clean:
	rm -fr .crystal $(BINARY)
