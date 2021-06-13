## Welcome to MonteCinema API Page

I've dedicated my time to develop that API during Monterail Rubycamp.

### About the project

The App uses multiple gems to develop an app such as:

```markdown
# Database
  -'pg'
# Authentication
  -'devise'
  -'doorkeeper'
  -'bcrypt'
# Scheduling Jobs
  -'sidekiq'
# Tests
  -'faker'
  -'simplecov'
  -'byebug'
  -'rspec-rails'
```
It uses as well multiple gem/tools

```markdown
# Tools
  -'redis'
  -'brakeman'
  -'bundle-audit'
  -'sentry-ruby'
  -'sentry-rails'
# Heroku addons
  -'scout_apm'
```


### How to run an app?
Clone the project via command.
```markdown
git clone https://github.com/KMosc/APITRY.git
```
Make sure You have your Ruby installed and its version equals 3.0.0
```markdown
ruby -v
```
Install all needed gem files
```markdown
bundle install
```
Database commands
```markdown
# Run Postgres
sudo service postgresql restart

# Initialize your rails databse
rails db:create

# Run database migration
rails db:migrate

# If you want sample datas, run
rails db:seed
```



### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/KMosc/APITRY/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
