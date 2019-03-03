FROM ruby:2.5.1-slim

USER root

RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev libxml2-dev libxslt1-dev apt-transport-https curl nano lsb-release

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update -qq && apt-get install -y nodejs

ENV APP_HOME /home/www/kuberton-shop
WORKDIR $APP_HOME

# Добавляем в текущий WORKDIR Gemfile и Gemfile.lock и вызываем команду по установке gem зависимостей. При отсутствии изменений в Gemfile и Gemfile.lock при следующем выполнении команды будет использоваться кэш
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . .

# Даем www-data пользователю права owner'а на необходимые директории:
RUN mkdir /var/www && \
  chown -R www-data:www-data /var/www && \
  chown -R www-data:www-data "$APP_HOME/."

USER www-data

RUN bundle exec rake assets:precompile

RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD bundle exec puma -C config/puma.rb
