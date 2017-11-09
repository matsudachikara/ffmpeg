class EmailSendWorker
  include Sidekiq::Worker
  sidekiq_options queue: :email

  def perform(*args)
    EmailSend.new(args[0])
  end
end
