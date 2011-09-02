#!/bin/bash

mkdir -p public/js
mkdir -p public/css

# handle javascript files
coffee -o public/js app/assets/javascripts/*.coffee
cp app/assets/javascripts/*.js public/js

# handle stylesheets
cp app/assets/stylesheets/*.scss public/css/
sass --update public/css
cp app/assets/stylesheets/*.css public/css

