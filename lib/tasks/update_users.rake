namespace :update_users do
  desc "Update user profile data"
  task profiles: :environment do
    User.all.each do |user|
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
end
