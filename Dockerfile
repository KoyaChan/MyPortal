FROM koyachan/ruby-vim
ENV APP_ROOT /usr/src/MyPortal
ENV LANG=ja_JP.UTF-8
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT

RUN apt-get update

RUN \
  apt-get install -y \
  node.js && \
  bundle install && \
  bundle update

EXPOSE 3000
CMD bash
