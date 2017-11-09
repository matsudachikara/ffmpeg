class CsvGenerateWorker
  include Sidekiq::Worker
  sidekiq_options queue: :csv

  def perform(*args)
    CsvGenerate.new(args[0])
  rescue => e
    raise e
  end
end
