# BirdWatch

[![Build Status](https://travis-ci.org/mkrogemann/bird_watch.svg)](https://travis-ci.org/mkrogemann/bird_watch)

Before you try to start the app, please install and start CouchDB.

Then, to start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. In case you want to seed the database, run `mix run priv/repo/seeds.exs`
     The seeding will run against the dev schema unless you specify another environment like so:
     MIX_ENV=prod mix run priv/repo/seeds.exs
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
