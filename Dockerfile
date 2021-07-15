FROM ruby:2.7.1-alpine

ENV BUNDLE_PATH=/bundle/vendor

WORKDIR /diving

RUN apk update && \
    apk add libxml2-dev \
    curl-dev \
    make \
    gcc \
    libc-dev \
    g++ \
    tzdata \
    postgresql-dev \
    postgresql-client \
    --no-cache

COPY Gemfile Gemfile.lock /diving/

RUN gem update && \
    bundle install -j18 && \
    bundle update

EXPOSE 3000
