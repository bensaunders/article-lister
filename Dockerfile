# syntax=docker/dockerfile:1
FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs sqlite3 libsqlite3-dev
RUN mkdir -p /article-lister
WORKDIR /article-lister
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]