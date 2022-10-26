# syntax=docker/dockerfile:1
FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /article-lister
COPY Gemfile /article-lister/Gemfile
COPY Gemfile.lock /article-lister/Gemfile.lock
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]