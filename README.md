# Commons API

#### Up-to-date information and notifications about bills in progress in Canada's parliament.

![Commons App](./docs/commons-readme.png)

## API Server for the Commons App

Commons aims to provide an easy to access source of information on current bills in session in Canada's federal parliament. The application sources data from various sources and serves it up to users in one easy to use location.

The goal is to provide Canadians with an easy way to keep up to date with the goings on in parliament and engage with their government representatives. The information aggregated by the app is sourced from various public government websites.

Bills are updated daily and sorted by category on the server. Users can select between email and SMS notifications for any bills they wish to follow and will receive daily updates if there are any new events for those bills.

The application also provides an easy way to look up Members of Parliament and retrieve their contact information.

## Behaviour

The server updates once every 24 hours from a variety of government data sources and pulls the latest bill and event data from them, then updates the data via a web based machine learning classification service. It then send notifications on those bills to all subscribed users.

# Stack

- [Ruby 2.7.0](https://www.ruby-lang.org/en/)
- [Ruby on Rails 6.0.2.1](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)

## Testing

- [Rspec](https://rspec.info/)

## Cloud Hosting

- [Heroku](https://www.heroku.com/)

It uses the following add-ons:

- [Cron To Go](https://elements.heroku.com/addons/crontogo)
- [Heroku Postgres](https://www.heroku.com/postgres)
- [Papertrail](https://my.papertrailapp.com/)

## Classification

The app uses the uClassify machine learning web service to classify bills.

- [uClassify](https://www.uclassify.com/)

## Notifications

Notifications are sent out using the following web services:

- [Twilio](https://www.twilio.com/)
- [SendGrid](https://sendgrid.com/)

### API Server

#### _The front end of the app is hosted on a separate API server._

#### [Git Repo for the Commons App](https://github.com/fgfl/commons)

### Website URL

### _COMING SOON_

### Team Members

- [Frederick Lee](https://github.com/fgfl/)
- [Mitch Lum](https://github.com/mxmitch)
- [Pascal van Leeuwen](https://github.com/Commoddity/)

# Configurations

### Rake commands

Database update tasks are run once every 24 hours as scheduled tasks

```
rake db:update_database - Updates database with the latest bills and related events.
rake db:update_categories - Updates all bills in the catabase that were posted that day.
```

Mail tasks are run once every 24 hours as scheduled tasks.

```
rake notify:send_notifications - Sends out SMS and email notifications for all users who are subscribed.
```

### Setup

- install `yarn`
- run `bundle install`

### Postgres Setup

External guide:
https://www.daveferrara1.com/ruby-in-rails-switch-from-sqlite3-to-postgres/

- create a development user
  - create a copy of the `config/secrets.yml.example` and rename it to `config/secrets.yml`.
  - change the username and password to your development user and password
  - add your uclassify read and write keys
- log in to the postgres with the dev user and create the dev and test database

```sql
CREATE DATABASE commons_development;
CREATE DATABASE commons_test;
```

### Database Reset

During development it may be necessary to reset the database. If so, perform the following actions:

```
rake db: drop
# drops database

in PSQL:
CREATE database commons_development;
CREATE database commons_test;
# creates database again

rake db:reset
# seeds database with categories and session

rake db:update_database

# populates database with bills from legisINFO (takes about a minute and a half)
# if you see Rescue exceptions in the console it means it's working as it should
```

### rspec Testing Setup

To setup rspec testing environment, run

```
rake db:test:prepare
rake db:test:load
```
