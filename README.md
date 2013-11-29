# we_love_heroku

[![Build Status](https://travis-ci.org/ppworks/we_love_heroku.png)](https://travis-ci.org/ppworks/we_love_heroku)

## Setup for development

rename Guardfile.example to Guardfile

```
$ cp Guardfile.example Guardfile
```

## External API Credential

```
cp config/application.yml.example config/application.yml
```

Fill in api credential

```
rake secret
```

Fill in SECRET_TOKEN by the key above result.

## Start foreman

```
$ foreman start -f Procfile.development
```

## heroku

```
heroku create we_love_heroku
git remote rename heroku we_love_heroku
git push we_love_heroku master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
rake figaro:heroku\[we_love_heroku\]
```

### staging

```
heroku create we_love_heroku-stg
git remote set-url we_love_heroku-stg git@heroku.com:we_love_heroku-stg.git
git push we_love_heroku master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
heroku addons:add mailtrap
heroku config:set RACK_ENV=staging RAILS_ENV=staging
rake figaro:heroku\[we_love_heroku-stg\]
```
