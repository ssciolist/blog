FROM ruby:2.6.8-alpine AS base

RUN apk add --update \
    postgresql-dev \
    build-base \
    tzdata \
    imagemagick \
    nodejs \
    yarn

FROM base AS dependencies

COPY Gemfile Gemfile.lock ./

RUN gem install nokogiri --platform=ruby
RUN gem install bundler -v 2.2.4

RUN bundle install --jobs=9 --retry=3

COPY package.json yarn.lock ./

# Install npm packages
RUN yarn install --frozen-lockfile

FROM base
# Create and set build context
RUN mkdir /src
WORKDIR /src

COPY --from=dependencies /usr/local/bundle /usr/local/bundle
COPY --from=dependencies /node_modules/ node_modules/

COPY . ./
RUN bundle exec rake assets:precompile

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]