# Ruby and Rails Info

Ruby and Rails [dot] info.
[Ruby and Rails Info](https://rubyandrails.info) website.

## Getting started with Docker
Tested on Linux Ubuntu 22.04

### Local Deployment with Docker
#### Start dev environment
`docker-compose up -d --build`

#### Allow to drop && seed database when initializing the dev environment
export $RECREATE_DB=true

#### Access the shell in the app container
`docker-compose run --rm --entrypoint sh app`

## Getting started without Docker
Tested on OSX M1 Ventura 13.4.1

### Requirements

Install gems via:

```bash
brew bundle install --no-upgrade
```

...or manually:

* Ruby 3.2.2
* [libpq](https://www.postgresql.org/docs/9.5/libpq.html) - `brew install libpq`
    * `libpg` is needed to use the native `pg` gem without Rosetta on M1 macs
* [postgresql](https://www.postgresql.org) - `brew install postgresql`
    * Note 1: PostgreSQL 13+ is required
    * Note 2: In case you're on Debian 11 and you have multiple versions (e.g. 9.x, 12.x, 14.x) of PostgreSQL installed, make sure that the server of the right version (13+) is listening on port `5432`. One could check/modify that in the `postgresql.conf` file, e.g. in case of version 13: `/etc/postgresql/13/main/postgresql.conf`.
* [node](https://nodejs.org/en/) - `brew install node`
* [Yarn](https://yarnpkg.com) - `brew install yarn`
* Google Chrome + Chromedriver for system tests - `brew install --cask google-chrome chromedriver`

### Initial setup

Start the PostgreSQL server.

```bash
brew services start postgresql
```

Install the Ruby gems.

```bash
bundle install
```

Create the database.

```bash
bundle exec rails db:create
```

Run the migrations.

```bash
bundle exec rails db:migrate
```

Seed the database.

```bash
bundle exec rails db:seed
```

### Running the app

Navigate to `http://localhost:3000` to access the website.

```bash
bundle exec rails s
```

## Testing

* Run `rails test` to run unit/integration tests.
* Run `rails test:system` to run system tests, using `headless_chrome`.