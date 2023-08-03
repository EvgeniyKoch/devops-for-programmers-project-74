prepare-env:
	cp -n .env.example .env

compose:
	docker-compose up  --remove-orphans

ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

stop:
	docker-compose stop

remove:
	docker-compose down
