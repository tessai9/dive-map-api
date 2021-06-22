FROM ruby:3.0.1-alpine

ENV BUNDLE_PATH=/bundle/vendor

WORKDIR /app

COPY Gemfile Gemfile.lock /app

RUN apk update \
    && apk add libxml2-dev \
    curl-dev \
    make \
    gcc \
    libc-dev \
    g++ \
    tzdata \
    postgresql-dev \
    postgresql-client \
    --no-cache && \
    bundle install

COPY . /app

EXPOSE 3000
