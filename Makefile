include .env
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
