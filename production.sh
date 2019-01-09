export SECRET_KEY_BASE=`RAILS_ENV=production rails secret`
export RAILS_SERVE_STATIC_FILES=true
rails server -e production
