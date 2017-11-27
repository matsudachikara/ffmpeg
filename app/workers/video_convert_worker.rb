class VideoConvertWorker < ApplicationController
  include Sidekiq::Worker
  sidekiq_options queue: :video_convert

  def perform(*args)
    VideoConvert.new(args[0])
  end
end
