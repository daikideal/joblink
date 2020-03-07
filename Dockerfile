FROM ruby:2.6.5
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    imagemagick \
    nodejs \
    yarn \
    chromium-driver \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /joblink
WORKDIR /joblink
COPY Gemfile /joblink/Gemfile
COPY Gemfile.lock /joblink/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /joblink

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]