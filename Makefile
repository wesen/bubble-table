.PHONY: example-pokemon
example-pokemon:
	@go run ./examples/pokemon/*.go

.PHONY: example-metadata
example-metadata:
	@go run ./examples/metadata/*.go

.PHONY: example-dimensions
example-dimensions:
	@go run ./examples/dimensions/main.go

.PHONY: example-events
example-events:
	@go run ./examples/events/main.go

.PHONY: example-features
example-features:
	@go run ./examples/features/main.go

.PHONY: example-filter
example-filter:
	@go run ./examples/filter/*.go

.PHONY: example-filterapi
example-filterapi:
	@go run ./examples/filterapi/*.go

.PHONY: example-flex
example-flex:
	@go run ./examples/flex/*.go

.PHONY: example-pagination
example-pagination:
	@go run ./examples/pagination/*.go

.PHONY: example-simplest
example-simplest:
	@go run ./examples/simplest/*.go

.PHONY: example-scrolling
example-scrolling:
	@go run ./examples/scrolling/*.go

.PHONY: example-sorting
example-sorting:
	@go run ./examples/sorting/*.go

.PHONY: example-updates
example-updates:
	@go run ./examples/updates/*.go

.PHONY: test
test:
	@go test -race -cover ./table

.PHONY: test-coverage
test-coverage: coverage.out
	@go tool cover -html=coverage.out

.PHONY: benchmark
benchmark:
	@go test -run=XXX -bench=. -benchmem ./table

.PHONY: lint
lint: ./bin/golangci-lint
	@./bin/golangci-lint run ./table

coverage.out: table/*.go go.*
	@go test -coverprofile=coverage.out ./table

.PHONY: fmt
fmt: ./bin/gci
	@go fmt ./...
	@./bin/gci write --skip-generated ./table/*.go

./bin/golangci-lint:
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ./bin v1.51.1

./bin/gci:
	GOBIN=$(shell pwd)/bin go install github.com/daixiang0/gci@v0.9.1

