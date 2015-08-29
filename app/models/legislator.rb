class Legislator
  def initalize(json:, chamber:)
    @rep_data       = filter(json)
    @chamber        = chamber.to_s
    @first_name     = rep_data["first_name"]
    @middle_name    = rep_data["middle_name"]
    @last_name      = rep_data["last_name"]
    @full_name      = rep_data["full_name"]
    @district       = rep_data["district"]
    @state          = rep_data["state"]
    @email          = rep_data["email"]
    @party          = rep_data["party"]
    @leg_id         = rep_data["leg_id"]
    @url            = rep_data["url"]
    @fax            = rep_data["offices"]["fax"]
    @phone          = rep_data["offices"]["phone"]
    @office_address = rep_data["offices"]["address"]
  end

  attr_reader :chamber, :first_name, :middle_name, :last_name,
              :full_name, :district, :state, :email, :party,
              :leg_id, :url, :fax, :phone, :office_address

  def committees
    rep_data["roles"].map { |role| role["committee"] }.compact
  end

  private

  def filter(json)
    json.select { |legislator| legislator["chamber"] == chamber }
  end
end
