FROM ruby:2.6.5
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    imagemagick \
    chromium-driver \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install nodejs

RUN mkdir /joblink
WORKDIR /joblink
COPY Gemfile /joblink/Gemfile
COPY Gemfile.lock /joblink/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /joblink
RUN mkdir -p tmp/sockets

VOLUME /joblink/public
VOLUME /joblink/tmp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]