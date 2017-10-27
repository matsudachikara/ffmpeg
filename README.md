# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization
  ```
  docker-compose run ffmpeg_mysql bundle exec rake db:create
  docker-compose run ffmpeg_mysql bundle exec rake db:migrate
  ```
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
  - ffmpeg使う時はffmpegコンテナをその起動して呼び出す
    docker run -it -v=$(pwd):/tmp/workdir matsudachikara/ffmpeg:latest $@

* Deployment instructions

* ...
