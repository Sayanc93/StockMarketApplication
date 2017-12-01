## BSE Stock data scraping Application!

<a href="https://codeclimate.com/github/Sayanc93/balbis/maintainability"><img src="https://api.codeclimate.com/v1/badges/db21a3e226a8ae982a69/maintainability" /></a>

**Rails version**: *5.1.4*

**Ruby version**: *2.3.1p112*

***Tools used***:

**GoogleOauth**: *login API*

**ActionCable + redis + sidekiq**: *To broadcast market data updates to frontend*

*Note*: You'd need to run `rake db:seed` to setup the initial set of companies and market data. You'll need to run *Sidekiq* and *Redis server* alongwith *Rails server*. Also, you'll need to replace .env.sample file with .env with google oauth keys for omniauth to work.
