include .env
invite:
	echo https://discord.com/oauth2/authorize?client_id=$(clientId)&permissions=277083450689&scope=bot%20applications.commands

deploy-bot:
	npm install && npm run deploy 

get-lavalink:
	curl -sSL https://github.com/freyacodes/Lavalink/releases/download/3.7.5/Lavalink.jar > lavalink/Lavalink.jar

start-lavalink:
	(cd lavalink && java -jar Lavalink.jar)

bot: 
	npm install && npm run start

report:
	npm install && npm run ddev
