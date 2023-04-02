include .env

LAVALINK_VERSION ?= 3.7.5

BOT_DOCKER=docker run --user root -it --rm \
	-v `pwd`:/workdir \
	-w /workdir \
	--env-file=.env \
	-p 80 \
	node:16 

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

invite:
	echo https://discord.com/oauth2/authorize?client_id=$(clientId)&permissions=277083450689&scope=bot%20applications.commands

deploy-bot:
	npm install && npm run deploy 

get-lavalink: 
	curl -sSL https://github.com/freyacodes/Lavalink/releases/download/$(LAVALINK_VERSION)/Lavalink.jar > Lavalink.jar

init_lavalink: guard-lavalinkPort guard-lavalinkHost guard-lavalinkPassword guard-youtubeEmail guard-youtubePassword
	poetry run python init_lavalink.py	

lavalink: init_lavalink
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

bot: 
	npm install && npm run start

report:
	npm install && npm run ddev
