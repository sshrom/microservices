FROM alpine:3.7

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

RUN apk update \
    && apk add --no-cache --virtual .build-deps gcc make musl-dev ruby ruby-dev ruby-bundler ruby-rdoc ruby-irb \
    && gem install bundler \
    && bundle install --no-cache \
    && bundle clean --force \
    && apk del .build-deps \
    && apk add --no-cache ruby-rdoc

COPY . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
