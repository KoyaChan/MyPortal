FROM koyachan/ruby-vim
ENV APP_ROOT /usr/src/MyPortal
ENV LANG=ja_JP.UTF-8
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT

RUN apt-get update

RUN \
  apt-get install -y \
  node.js \
# --- qt5 needed for Capybara
  qt5-default \
  libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools \
  gstreamer1.0-x && \
# --- qt5 end
  bundle install && \
  bundle update

EXPOSE 3000
CMD bash
