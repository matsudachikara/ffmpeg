class ImageCollectWorker
  include Sidekiq::Worker
  sidekiq_options queue: :image

  def perform(*args)
    ImageCollect.new(args[0])
  end
end
