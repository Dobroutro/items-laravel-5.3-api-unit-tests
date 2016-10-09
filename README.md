# items-laravel-5.3-api-unit-tests
Items API with Authentication and Unit tests using Laravel 5.3 and Angularjs for example test implementation of the API.


# Installation 

git clone https://github.com/Dobroutro/laravel-books-test.git some_folder 

cd /books

composer update

# Environment setup

edit mysql credentials and copy or rename .env.example to .env

edit accordingly config/database.php mysql credentials

write permissions necessary to be set eventually for directories

storage/

# Automatic Install Database

php artisian migrate

php artisan db:seed --class=UsersTableSeeder

# Manual Install Database

sample_database.sql 


# Angularjs auth config 
Angularjs module should be authenticated with the "api_token" of some of the available users 
If you use authomatic laravel seeding or sample database install, a change in public/app/routes.js api_token var will not be necessary, otherwise just update it with the api_token value of some of the new added users 

# PHP Unit Tests
Unit test use also api_token of some available users
If you use authomatic laravel seeding or sample database install, a change in tests/ApiTest.php api_token var will not be necessary, otherwise just update it with the api_token value of some of the new added users 
