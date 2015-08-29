class Legislator
  def initialize(json:, chamber:)
    @chamber = chamber.to_s
    @rep_data        = filter(json)
  end

  attr_reader :rep_data
  private     :rep_data

  def first_name
    rep_data["first_name"]
  end

  def middle_name
    rep_data["middle_name"]
  end

  def last_name
    rep_data["last_name"]
  end

  def full_name
    rep_data["full_name"]
  end

  def district
    rep_data["district"]
  end

  def state
    rep_data["state"]
  end

  def committees
    rep_data["roles"].map { |role| role["committee"] }.compact
  end

  def email
    rep_data["email"]
  end

  def party
    rep_data["party"]
  end

  def leg_id
    rep_data["leg_id"]
  end

  def url
    rep_data["url"]
  end

  def fax
    rep_data["offices"]["fax"]
  end

  def phone
    rep_data["offices"]["phone"]
  end

  def address
    rep_data["offices"]["address"]
  end

  private

  def filter(json)
    json.select { |legislator| legislator["chamber"] == chamber }
  end
end
