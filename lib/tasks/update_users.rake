namespace :update_users do
  desc "Update user profile data"
  task profiles: :environment do
    User.find_each do |user|
      legislators = OpenStatesWrapper.call(
        call_type: :geo_lookup,
        url_parameters: {
          "lat"  => user.latitude,
          "long" => user.longitude
        }
      )

      representative = Legislator.new(json: legislators, chamber: :lower)
      senator        = Legislator.new(json: legislators, chamber: :upper)

      user.state           = representative.state
      user.house_district  = representative.district
      user.representative  = representative.full_name
      user.senate_district = senator.district
      user.senator         = senator.full_name
      user.save!
    end
  end

  desc "Migrate user date to user_profile"
  task migrate: :environment do
    User.find_each do |user|
      profile = UserProfile.new
      profile.user_id         = user.id
      profile.address         = user.address
      profile.latitude        = user.latitude
      profile.longitude       = user.longitude
      profile.state           = user.state
      profile.house_district  = user.house_district
      profile.senate_district = user.senate_district
      profile.representative  = user.representative
      profile.senator         = user.senator
      profile.save!
    end
  end

  desc "Downcase user names"
  task downcase: :environment do
    User.find_each do |user|
      user.email.downcase!
      user.save!
    end
  end
end
