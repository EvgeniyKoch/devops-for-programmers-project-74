compose:
	docker compose up -d

compose-production:
	docker compose --file docker-compose.yml run production

compose-build:
	docker compose build

compose-logs:
	docker compose logs -f

compose-down:
	docker compose down --remove-orphans || true

compose-clear:
	docker compose down -v --remove-orphans || true

compose-stop:
	docker compose stop || true

compose-restart:
	docker compose restart

compose-setup: compose-down compose-build

compose-ci-build:
	docker build -f Dockerfile.production -t hexletbasics/services-app .
	docker build -f services/web-nginx/Dockerfile -t hexletbasics/services-web .
	docker compose -f docker-compose.yml build

compose-ci:
	docker compose --file docker-compose.yml up --abort-on-container-exit