.PHONY: help
help: ## show help
	@grep -hE '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-17s\033[0m %s\n", $$1, $$2}'

.PHONY: lint
lint: ## run golangci-lint
	@golangci-lint run ./...

.PHONY: gazelle
gazelle: ## run gazelle with bazel
	@bazel run //:gazelle

.PHONY: build
build: ## build go binary
	@bazel build //...

.PHONY: test
test: ## test go binary
	@bazel test --verbose_failures //...
