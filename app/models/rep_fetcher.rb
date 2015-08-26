require "open-uri"
require "json"
class RepFetcher
  def initialize(user)
    @long          = user.longitude
    @lat           = user.latitude
    @reps          = fetch_reps
    @represenative = build_rep("lower")
    @senator       = build_rep("upper")
  end


  attr_reader :long, :lat, :reps, :represenative, :senator
  private     :long, :lat, :reps

  def senator
  end

  private

  def fetch_reps
    uri = "http://openstates.org/api/v1/legislators/geo/?lat=#{lat}&long=#{long}&apikey=#{OPAPI}"
    JSON.parse(open(uri).read)
  end

  def build_rep(chamber)
    if reps.first["chamber"] == chamber
      return Legislator.new(reps.first)
    elsif reps.last["chamber"] == chamber
      return Legislator.new(reps.last)
    end
  end
end
