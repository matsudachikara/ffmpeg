class VideoConvert
  def initialize(article)
    @article = article
    @movie = FFMPEG::Movie.new(@article.video)
    p @movie
    transcoder_options = { validate: false }
    @movie.transcode("public/videos/article/#{@article.id}", options, transcoder_options)
  end
end
