FROM ruby:2.6.3-alpine

RUN apk add --update \
    nodejs \
    postgresql-dev \
    build-base \
    tzdata \
    imagemagick \
    yarn

# Create and set build context
RUN mkdir /src
WORKDIR /src

ENV BUNDLER_VERSION=2.2.4
ENV BUNDLE_PATH /gems
RUN gem install bundler -v 2.2.4

COPY package.json yarn.lock ./

COPY . ./

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
