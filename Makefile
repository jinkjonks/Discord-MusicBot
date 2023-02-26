include .env

LAVALINK_VERSION ?= 3.7.5

BOT_DOCKER=docker run --user root -it --rm \
	-v `pwd`:/workdir \
	-w /workdir \
	--env-file=.env \
	-p 80 \
	node:16 

invite:
	echo https://discord.com/oauth2/authorize?client_id=$(clientId)&permissions=277083450689&scope=bot%20applications.commands

deploy-bot:
	npm install && npm run deploy 

get-lavalink: 
	curl -sSL https://github.com/freyacodes/Lavalink/releases/download/$(LAVALINK_VERSION)/Lavalink.jar > Lavalink.jar

build-lavalink:
	docker build -t lavalink:latest -f lavalink.Dockerfile .

docker-lavalink: build-lavalink 
	docker run --env-file=.env --rm \
	-p $(lavalinkPort):$(lavalinkPort) \
	-v `pwd`/application.yml:/workdir/application.yml \
	-w /workdir \
	lavalink:latest

start-lavalink:
	java -jar Lavalink.jar

bot: 
	npm install && npm run start

report:
	npm install && npm run ddev


invite:
	echo https://discord.com/oauth2/authorize?client_id=$(clientId)&permissions=277083450689&scope=bot%20applications.commands

deploy-bot:
	npm install && npm run deploy 

start-lavalink:
	(cd lavalink && java -jar Lavalink.jar) > /dev/null &

bot: start-lavalink
	npm install && npm run start

report:
	npm install && npm run ddev
