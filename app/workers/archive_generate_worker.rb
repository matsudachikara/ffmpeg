class ArchiveGenerateWorker
  include Sidekiq::Worker
  sidekiq_options queue: :archive

  def perform(*args)
    ArchiveGenerate.new(args[0])
  end
end
