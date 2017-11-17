class VideoConvertWorker
  include Sidekiq::Worker
  sidekiq_options queue: :video

  def perform(*args)
    VideoConvert.new(args[0])
  end
end
