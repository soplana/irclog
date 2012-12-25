# lognyan


## install

```bash
$ git clone https://github.com/soplana/irclog.git
Cloning into 'irclog'...
remote: Counting objects: 77, done.
remote: Compressing objects: 100% (62/62), done.
remote: Total 77 (delta 0), reused 77 (delta 0)
Unpacking objects: 100% (77/77), done.
$ cd irclog/ 
$ bundle install --path vendor/bundle
Fetching gem metadata from https://rubygems.org/.........
Fetching gem metadata from https://rubygems.org/..
Installing rake (10.0.3) 
Installing i18n (0.6.1)
…
```

## setting

```bash
$ bundle exec rails g mongoid:config

Mongoid config not found. Create a config file at: config/mongoid.yml
to generate one run: rails generate mongoid:config

      create  config/mongoid.yml
```

edit mongoid.yml

- hosts

```yml
production:
  sessions:
    default:
      database: irclog
      hosts:
        - xx.xx.xx.xx:27017
```

edit script/lognyan.rb

- c.server
- c.password
- c.channels

```ruby
# -*- coding: utf-8 -*-
require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.xxxx.com"
    c.password = "xxxxx"
    c.channels = ["#xxxxx"]
    c.nick     = "lognyan"
  end

  on :message do |m|
    Log.create({
      name: m.user.nick,
      text: m.message,
      time: Time.now.to_s
    })
  end

end

bot.start
```

## lognyan start

```bash
$ nohup bundle exec rails r script/lognyan.rb -e production > /dev/null 2>&1 &
$ nohup bundle exec rails s -p 3002 -e production > /dev/null 2>&1 &
```
