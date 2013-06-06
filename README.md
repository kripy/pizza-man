# Pizza Man

Pizza Man is a Heroku ready [Sinatra](http://www.sinatrarb.com/) app, running on [Unicorn](http://unicorn.bogomips.org/), that utilises [Mustache](http://mustache.github.io/) for templating and [HTML5 boilerplate](http://html5boilerplate.com/) for front-end goodness.

## Installation

Firstly, make sure you've [installed Ruby](http://www.ruby-lang.org/en/). Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/) as it includes [Foreman](https://github.com/ddollar/foreman) for running Procfile-based applications.

Then in terminal, clone me:

```
$ git clone git@github.com:/kripy/pizza-man my-pizza-man
$ cd my-pizza-man
$ foreman start
```

Open up a browser at ```http://localhost:5000/```: now you're cooking!

## Deployment

If you don't already have one, sign up for a [Heroku](https://www.heroku.com/) account. Everything you need to know and do to deploy is in [Getting Started with Ruby on Heroku](https://devcenter.heroku.com/articles/ruby).

In terminal, cd to your app:

```
$ cd my-pizza-man
$ git init
$ git add .
$ git commit -m "init"
$ heroku create
$ git push heroku master
$ heroku open
```

Then watch the magic happen.