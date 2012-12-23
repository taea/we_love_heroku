# We love heroku

[![Build Status](https://travis-ci.org/ppworks/we_love_heroku.png)](https://travis-ci.org/ppworks/we_love_heroku)

# How to start

## for local

### Create Database

```
rake db:setup
```

### Copy .env.sample to .env

```
cp .env.sample .env
```

You should create  at least one app(Facebook app or Twitter app or Github app).

### Create Facebook app

* Vist [Facebook Developers](https://developers.facebook.com/apps)
* Click **Create New App**
* Fill in **App Name**

```example
App Name: we love heroku for local
```

* Set your **App ID/API Key** to **FB_APP_ID** in .env file.
* Set your **App Secret** to **FB_APP_SECRET** in .env file.

```example
FB_APP_ID=123456789
FB_APP_SECRET=abcdefg
```

### Create Twitter app

* Visit [My applications](https://dev.twitter.com/apps)
* Click **Create a new application**
* Fill in **Name**, **Description**, **Website**, and **Callback URL**(Although it has not required mark)

```example
Name: we love heroku local
Description: it's local test application for me.
Website: http://localhost:3000
Callback URL: http://localhost:3000
```

* Set your **Consumer key** to **TW_APP_ID** in .env file.
* Set your **Consumer secret** to **TW_APP_SECRET** in .env file.

```example
TW_APP_ID=1a2b3c4d5d
TW_APP_SECRET=a1b2c3d
```

### Create Github app

* Visit [Register a new OAuth application](https://github.com/settings/applications/new)
* Fill in **Application Name**, **Main URL**, **Callback URL**

```example
Application Name: weloveheroku-local
Main URL: http://localhost:3000
Callback URL: http://localhost:3000/users/auth/github/callback
```

* Set your **Client ID** to **GH_APP_ID** in .env file.
* Set your **Client Secret** to **GH_APP_SECRET** in .env file.

```example
GH_APP_ID=1a2b3c4d5d
GH_APP_SECRET=a1b2c3d
```

### Start server

```
foreman start
```

### Access localhost

```
open http://loalhost:3000
```
