class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(name, email)
    Emailer.all_data(name, email).deliver_later
  end
end
