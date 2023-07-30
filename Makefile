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
	cp -n app/.env.example .env

compose:
	docker-compose up

ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
