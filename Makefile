dev-up:
	docker compose -f compose.yml -f compose.dev.yml up -d

dev-down:
	docker compose -f compose.yml -f compose.dev.yml down

dev-logs:
	docker compose -f compose.yml -f compose.dev.yml logs -f

dev-ps:
	docker compose -f compose.yml -f compose.dev.yml ps
