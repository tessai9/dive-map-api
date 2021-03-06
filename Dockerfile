FROM ruby:3.0.3-alpine

ENV BUNDLE_PATH=/bundle/vendor

WORKDIR /diving

RUN apk update && \
    apk add libxml2-dev \
    curl-dev \
    make \
    gcc \
    less \
    libc-dev \
    g++ \
    tzdata \
    postgresql-dev \
    postgresql-client \
    --no-cache

COPY Gemfile Gemfile.lock /diving/

RUN gem update bundler && \
    bundle install -j18

EXPOSE 3000
