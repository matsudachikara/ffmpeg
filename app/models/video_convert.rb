class VideoConvert
  def initialize(article_id)
    @article = Article.find(article_id)
    @movie = FFMPEG::Movie.new(@article.video_url.file.file)
    dir_name = File.dirname(@article.video_url.file.file)
    base_name = File.basename(@article.video_url.file.file, ".*")
    options = %w(-vcodec libx264 -b:v 800k -acodec libfdk_aac -b:a 128k -flags +loop-global_header -map 0 -bsf h264_mp4toannexb -f segment -segment_format mpegts -segment_time 10 -segment_list)
    options << "#{dir_name}/#{base_name}.m3u8"
    transcoder_options = { validate: false }
    @movie.transcode("#{dir_name}/v%04d.ts", options, transcoder_options)
    @article.update_columns(video_url: "#{base_name}.m3u8", video_status: 'transcoded')
  end
end
