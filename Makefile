setup:
	npm ci

start:
	npm start

dev:
	npm run dev

lint:
	npx eslint .

test:
	npm test

heroku-logs:
	heroku logs --tail

prepare-env:
	cp -n .env.example .env

compose:
	docker-compose up  --remove-orphans

ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

stop_all:
	docker ps -q | xargs -L 1 docker stop

remove_all:
	docker ps -aq | xargs -L 1 docker rm -f

clean: stop_all remove_all

