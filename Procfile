release: PG_STATEMENT_TIMEOUT=90000 bundle exec rails db:migrate
web: RUBYOPT='-W:no-deprecated -W:no-experimental' bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}