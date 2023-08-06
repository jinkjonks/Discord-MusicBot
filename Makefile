deploy-bot:
	npm install && npm run deploy 

bot: 
	npm install && npm run start

report:
	npm install && npm run ddev

invite:
	echo https://discord.com/oauth2/authorize?client_id=$(clientId)&permissions=277083450689&scope=bot%20applications.commands

populate-secrets:
	rm -f secrets/*.txt
	for line in $$(cat .env); do \
		name=$$(echo $$line | cut -d= -f1 | tr '[:upper:]' '[:lower:]'); \
		value=$$(echo $$line | cut -d= -f2); \
		echo $$value > secrets/$$name.txt; \
		docker secret create $$name secrets/$$name.txt; \
	done
