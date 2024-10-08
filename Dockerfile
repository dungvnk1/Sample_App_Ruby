FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
