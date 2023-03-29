# README

This is the code used for [https://rubyandrails.info](https://rubyandrails.info) website.


### Local Deployment with Docker (Tested on Linux Ubuntu 22.04)
#### Start dev environment
`docker-compose up -d --build`

#### Allow to drop && seed database when initializing the dev environment
export $RECREATE_DB=true

#### Access the shell in the app container
`docker-compose run --rm --entrypoint sh app`
