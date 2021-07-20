# README
## Welcome to MonteCinema API Page
documentation
- https://kmosc.github.io/APITRY/
- I've dedicated my time to develop that API during Monterail Rubycamp.
### About the project!

The App uses multiple gems, You can find its list in Gemfile.

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
<br/>

```markdown
### Initialize your rails databse
rails db:create

### Run database migration
rails db:migrate

### If you want sample datas, run
rails db:seed
```
### Before you run the server, make sure your postgres and redis-sever are running, if not. Restart it

### If you want your mailer to work.
```markdown
https://support.google.com/accounts/answer/185833?hl=en

Look into /config/environments/ and initialize environment variables accordingly to email config.

Change default mailers in mailer files.
```

### If you want to start server
```markdown
# Development mode
rails s
# Production mode.
rails s -e production
```

### Testing
## If you want to generate Coverage of the Tests
```markdown
COVERAGE=true rspec spec
```
<br/>
