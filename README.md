* Rails, ffmpegを同じコンテナでbuildする
  * dcoker pullでcentos7のイメージをダウンロード

    `Docker pull centos:latest`
  * Dockerfileとdocker-compose.ymlでコンテナを作成

    `docker-compose up`

* Dockerコンテナ内でDB作成、マイグレーション
```
docker-compose run web bundle exec rake db:create
docker-compose run web bundle exec rake db:migrate
```

* ffmpeg使う時はffmpegコンテナをその起動して呼び出す
    docker run -it -v=$(pwd):/tmp/workdir matsudachikara/ffmpeg:latest $@

* その他dockerコマンド
  * コンテナに入りたい時

    `docker exec -it ffmpeg_web bash`

  * dockerコンテナ一覧表示

      `docker ps`

  * dockerイメージ一覧表示

      `docker images`

  * dockerコンテナ削除

      `docker rm コンテナ名 or コンテナID`
