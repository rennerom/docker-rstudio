# Docker Makefile for RStudio

.PHONY: start
start:

	docker compose up -d --build
	while ! curl --fail --silent --head http://localhost:8787; \
		do sleep 1; \
	done
	open http://localhost:8787

.PHONY: stop
stop:

	docker compose down