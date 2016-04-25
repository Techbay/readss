# which image to use
FROM ruby:2.3.0

MAINTAINER ian027

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
# for postgres
RUN apt-get install -y libpq-dev
# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev
# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install
RUN RAILS_ENV=production rake db:migrate

ADD . $APP_HOME
