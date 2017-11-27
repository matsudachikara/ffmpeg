FROM ruby:2.4.2-alpine
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mysql mysql-client mysql-dev logrotate" \
    RUBY_PACKAGES="ruby-json yaml nodejs imagemagick imagemagick-dev"

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app

WORKDIR /ffmpeg
COPY . /ffmpeg
EXPOSE 3030
RUN gem install nokogiri -- --use-system-libraries && \
    gem install rails --pre && \
    bundle install

CMD lib/docker/run.sh
