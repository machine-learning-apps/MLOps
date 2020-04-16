FROM ruby

RUN set -ex \
  && apt-get update -y \
  && apt-get install nodejs locales -y

WORKDIR /usr/srv
COPY Gemfile /usr/srv
RUN bundle install
