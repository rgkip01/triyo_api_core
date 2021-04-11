FROM ruby:2.5.8 

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /triyo_api_core

COPY Gemfile /triyo_api_core/Gemfile
COPY Gemfile.lock /triyo_api_core/Gemfile.lock

RUN bundle install

COPY . /triyo_api_core
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]