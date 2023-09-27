install:
	raco pkg install sicp
	raco pkg install review

test:
	raco test sicp

lint:
	@echo "check codestyle"
	@(for f in $$(find sicp -name '*.scm'); do raco review $$f; done)

.PHONY: test