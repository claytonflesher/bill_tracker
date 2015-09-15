namespace :bill_status do
  desc "Check status of bills and email updates"
  task email_updates: :environment => do
    Bill.find_each do |bill|
      updated_description = BillsWrapper.call(bill_name: bill.name)
      unless bill.description == updated_description
        bill.users.each do |user|
          bill.description = updated_description
          bill.save!
          UserMailer.send_update(user: user, bill: bill).deliver_now
        end
      end
    end
  end
end
