# FROM openapitools/openapi-generator-cli:latest-release AS openapi

# RUN mkdir /spec

# COPY ./spec/openapi.yml /spec

# RUN generate -i /spec/openapi.yml -g ruby -o /local

FROM ruby:2.7.1-alpine

ENV BUNDLE_PATH=/bundle/vendor

WORKDIR /app

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

COPY Gemfile Gemfile.lock /app

RUN gem update && \
    bundle install -j18 && \
    bundle update

# COPY --from=openapi /local /diving/app/openapi

EXPOSE 3000
