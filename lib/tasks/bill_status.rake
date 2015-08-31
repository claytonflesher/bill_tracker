namespace :bill_status do
  desc "Check status of bills and email updates"
  task :email_updates
  User.all.each do |user|
    user.bills.each do |bill|
      updated_description = BillsWrapper.call(bill_name: bill.name)
      unless bill.description == updated_description
        bill.description = updated_description
        bill.save!
        UserMailer.send_update(user: user, bill: bill).deliver_now
      end
    end
  end
end
