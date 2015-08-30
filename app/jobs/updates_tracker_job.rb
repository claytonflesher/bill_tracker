class UpdatesTrackerJob < ActiveJob::Base
  queue_as :default

  def perform
    puts "Hi Mom"
    User.all.each do |user|
      user.bills.each do |bill|
        updated_description = BillsWrapper.call(bill_name: bill.name)
        unless bill.description == updated_description
          UserMailer.send_update(
            user: user, 
            description: updated_description
          ).deliver_now
        end
      end
    end
  end
end
