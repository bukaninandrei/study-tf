FROM ruby:3.0.1-alpine

RUN apk update && apk add --no-cache build-base bash git vim curl

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN /usr/local/bin/bundle install

ADD . /app

EXPOSE 4000

CMD bash -c 'bundle exec rackup'
