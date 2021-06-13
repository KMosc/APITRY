## Welcome to MonteCinema API Page

I've dedicated my time to develop that API during Monterail Rubycamp.
### About the project

The App uses multiple gems such as:

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
<br/>
### Run Postgres
sudo service postgresql restart

### Initialize your rails databse
rails db:create

### Run database migration
rails db:migrate

### If you want sample datas, run
rails db:seed
```
### Before you run the server, make sure your redis-sever running, if not. Restart it
```markdown
sudo service redis-server restart
```
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
# Production mode
rails s -e production
```

### Testing
## If you want to generate Coverage of the Tests
```markdown
COVERAGE=true rspec spec
```
<br/>
<br/>
<br/>

# Website Functionalities

### What user can do during using the site?
```markdown
Each user can
  -Log in
  -Log out
  -Create account
  -Get list of ticket desks
  -Get list of Cinema Halls.
  -Get list of movies that are playing
  -Get list of empty seats for the movie
  -Get list of tickets that is linked to their email
  -Buy a ticket
    -You get confirmation on email.
  -Make Reservation
    -Your ticket is gonna be deleted if you dont pay 30 minutes before movies start.
```
<br/>
### Know How
<br/>
### Wrap your mind around the API, How It all works.
The project has multiple components. Lets start the reading.

## Relationship between models. Database schema.
```markdown
# There is Ticket that belongs to:
  -user, based on email. User email is unique!
  -movie
```
Each movie is as well seance. It has its starts' date and ends' date. It has referece to cinema hall, where ticket gets number of total tickets for choosen movie.

# How ticket recognization works?
```markdown
- You can take only take ticket thats' seat is declared in empty seats list.
- Each cinema hall has its volume.
- the API creates empty seats list accordingly to volume of cinema hall, each row has max. 10 seats
```
<br/>
# How the Authentication works?
```markdown
# What does happpen in controller once You create an account?

## Creation of account
-User_controller checks 
  -if your params[:email] is email,
  -if params[:password] has desired length.
-It searches if params[:client_id] is equal any of Doorkeeper::Application.uid, either 
  -It returns error message.
# Creation of Token
-It creates Doorkeeper::AccessToken using your client_id,Doorkeeper::Application.uid and reftoken
-Two the same refresh tokens cannot exist
  -it checks in database and returns the one that not exist". 
    -Each token has some expiration date.
-After creation, it renders the nessesary information for user to log in:
  -auth token type, expiration date, access_token
## Log in
-Every time we want to log in to authorized page,
-It checks if our token exists in Doorkeeeper::AccessToken and is assigned to our account.
-If we want to refresh our access_token expired.
  -We log in, we use client_id, client_secret, email and password, new token is assigned.
```

# Changelog
### MonteCinema v0.0.1.4.1
- [x] split main methods to sub methods
- [x] better names for methods
### MonteCinema v0.0.1.4
- [x] Adding faker to rspec tests
- [x] Installing gems: bundle-audit,brakeman, simplecov
- [x] Adding payment history model
- [x] Adding job to delete not paid ticket from tickets, add its record to payment history.
- [x] Adding wait to scheduled job for some minutes 
- [x] Adding mailer to job. Once job is called, mail is being sent to the user.

### MonteCinema v0.0.1.3.5
- [x] Register + Login with devise and doorkeeper
- [x] Employee recognization => boolean type "admin" column in user model.
- [x] Post requests to create [ cinema hall, ticketdesk, movie, genre ] if user is admin
### MonteCinema v0.0.1.3
- [x] Clearing code
- [x] Adding Validates_presence_of
- [x] Deployment to Heroku
- [x] Mailer is working
- [x] Mail validation
### MonteCinema v0.0.1.2.6
- [x] Default value for each repository, constructor runs without args, accordindly to module/class.
### MonteCinema v0.0.1.2.5
- [x] Uniqness validator for ticket
- [x] Validator for buy usecase, new private methods
### MonteCinema v0.0.1.2.3
- [x] Adding Monteway to API
- [x] Adding Base Class for Usecase, Repository and Representer
- [x] Sets(usecase, repository, representer) of each models inherits from Base
- [x] Adding usecase for returning seats that were taken and matrix representation of cinema_hall.
- [x] Adding usecase for buying tickets
- [x] Documentation add url
### MonteCinema v0.0.1.2.1
- [x] Adding => password .attribute] to: ticket .model
- [x] Re-working =>ticket controller
- [x] Hiding few columns while rendering json
- [x] Adding password to set_ticket_params
- [x] Available 🎟tickets [boolean test change]
### MonteCinema v0.0.1.2
- [x] Adding => [genre model & controller]
- [x] Ticket buying to choosen movie [fixup!]
- [x] Deleting => [user model & controller]
### MonteCinema v 0.0.1.7
- [x] Adding validators
- [x] Creating models and its controllers => movie, client, genre
- [x] Re-working model => ticket
### MonteCinema v0.0.1.3
- [x] Adding Gems => [Rspec, sentry]
- [x] Controller re-working
### MonteCinema v0.0.1.1
- [x] Fixing Availability of cinema_hall, can't buy if there is no tickets left. fixup
- [x] Fixing methods => [buy, booked]

### MonteCinema v0.0.1 
- [x] Creating models and its controllers => ticket_desk, cinema_hall, ticket
- [x] Creating methods to handle listing rows of data based on url params.
- [x] Models => [ticket_desk , cinema_hall] has features such as has_and_belongs_to_many.
- [x] Creating methods to handle booking and buy.
- [x] Availability of cinema_hall, can't buy if there is no tickets left.
