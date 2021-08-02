FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create and set build context
RUN mkdir /src
WORKDIR /src

ENV BUNDLER_VERSION=2.2.4
RUN gem install bundler -v 2.2.4

COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY package.json yarn.lock ./


COPY . ./

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
