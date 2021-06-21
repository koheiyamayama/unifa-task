FROM ruby:2.7.2
RUN mkdir /app 
WORKDIR /app
RUN gem install rails -v 5.2.6
COPY ./ /app
RUN bundle install
