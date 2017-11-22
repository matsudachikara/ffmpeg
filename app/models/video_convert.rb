class VideoConvert
  def initialize(article)
    @article = article
    @movie = FFMPEG::Movie.new(@article.video)
    p @movie
    options = {
      video_codec: 'libx264',
      '-b:v': '800k'
    }
    transcoder_options = { validate: false }
    @movie.transcode("public/videos/article/#{@article.id}", options, transcoder_options) do |progress|
      puts progress
    end
  end
end
