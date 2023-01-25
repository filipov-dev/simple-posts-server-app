FROM ruby:3.0.5-bullseye

RUN mkdir -p /app
WORKDIR /app

RUN apt-get update && apt-get install -y imagemagick
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

ENV LANG=C.UTF-8

ADD Gemfile /app/
#ADD Gemfile.lock /app/

RUN gem update --system && gem install bundler
RUN gem install debase-ruby_core_source

RUN bundle install

EXPOSE 3000
