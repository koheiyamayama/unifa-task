FROM ruby:2.7.2
RUN apt-get update && apt-get install -y nodejs
RUN mkdir /app 
WORKDIR /app
RUN gem install rails -v 5.2.6
COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN bundle install
COPY ./ /app
