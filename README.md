# mr_bots-webapp
Gains made easy w rails. Get on the train. 

## Setup
Add this to your .bashrc or .bash_profile, based on your postgres user.

	# set the environment variables for MR_BOTS postgres db 
	export MR_PG_USER=mrbot 
	export MR_PG_PWD=mrbot123 

## SSH and Database Access to Prod

1. `ssh -i /path/to/mr_bots.pem ubuntu@mrbots.net
2. `psql -U mr_bots-webapp -d production`

## Steps for Deploying Update to Prod

1. Pull the latest commit of the github repo
2. Apply migrations with `RAILS_ENV=production rake db:migrate`
3. Generate new static assets with `RAILS_ENV=production rake assets:precompile`
4. Restart the service with `sudo service unicorn_mr_bots-webapp-PROD stop`, `sudo service unicorn_mr_bots-webapp-PROD start`

