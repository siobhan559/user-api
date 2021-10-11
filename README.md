# README

A simple RESTful API, with one "User" model.
Built on Rails 6.1.4.1, using a postgreSQL database. Skipped Active Storage and Action Mailbox to keep the API lightweight, and -T to use another testing system rather than Rails' inbuilt Minitest.

Users have a username, email, password (and password confirmation) and active/inactive state, which defaults to active.

## Setup

The API uses extra gems not provided in a standard Rails API:

```
gem 'faker' # for seeding our database
gem 'bcrypt', '~> 3.1.7' # to encrypt passwords in our DB
```

And also within our Gemfile:

```
group :development, :test do
  gem 'rspec-rails', "4.0.1" # Our minitest replacement
  gem 'factory_bot_rails' # Also helps fill our testfile
  gem 'dotenv-rails' # Allows us to create environmentl variables for our API key
end
```

Then to generate our testing spec folder run:

```
rails generate rspec:install
```

A .env file must also be created to define our API_KEY used for DELETE requests. In order for this secret key to not be put into public access run:

```
echo '.env*' >> .gitignore
```

## Make GET, POST and DELETE requests.

To return our index of all users in our database run:

```
curl -X GET http://localhost:3000/api/v1/users 
```

To show one user:

```
curl -X GET http://localhost:3000/api/v1/users/:id
```

To create a new user:

```
curl -X POST -H "Content-Type: application/json" -d '{"username": "test_username" , "email": "testing@test.com", "password": "password", "password_confirmation": "password"}' http://localhost:3000/api/v1/users
```

And to delete a user:

```
curl -X DELETE -H "Authorization: <your api key here>" http://localhost:3000/api/v1/users/:id
```

