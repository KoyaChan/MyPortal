FROM koyachan/ruby-vim
ENV APP_ROOT /usr/src/MyPortal
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT

RUN apt-get update

RUN \
  apt-get install -y \
  node.js && \
  bundle install

EXPOSE 3000
CMD bash
