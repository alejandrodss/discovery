FROM ruby:2.5.5

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn

RUN mkdir /discovery_ads
WORKDIR /discovery_ads

ENV BUNDLE_PATH /discovery_ads/gems
ENV GEM_HOME /discovery_ads/gems

RUN apt-get install -y w3m bc
ENTRYPOINT ["./docker_entrypoint"]
