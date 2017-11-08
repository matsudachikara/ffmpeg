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

* ffmpeg使用例
  * h264をhlsに変換

    ```
    ffmpeg -i Star_Wars_-_The_Last_Jedi_-_Trailer_2__H.264_.mp4 -movflags faststart -profile:v 66 -level 3.0 -g 150 -b:v 519k -s 768x432 -acodec libfdk_aac -b:a 63.4k -ar 44100 -flags +loop-global_header -map 0 -bsf h264_mp4toannexb -f segment -segment_format mpegts -segment_time 5 -segment_list playlist.m3u8 v%03d.ts
    ```

* 参考
  * https://github.com/jrottenberg/ffmpeg
  * https://qiita.com/neko88/items/bda8d36bac38718c95c7
