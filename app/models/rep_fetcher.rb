require "open-uri"
require "json"
class StateFetcher
  def initialize(long:, lat:)
    @long          = long
    @lat           = lat
    @reps          = fetch_reps
    @represenative = build_rep("lower")
    @senator       = build_rep("upper")
  end

  URI = "http://openstates.org/api/v1/legislators/geo/?lat=#{lat}&long=#{long}&apikey=#{OPAPI}")

  attr_reader :long, :lat, :reps, :represenative, :senator
  private     :long, :lat, :reps

  def senator
  end

  private

  def fetch_reps
    JSON.parse(open(URI).read)
  end

  def build_rep(chamber)
    if reps.first["chamber"] == chamber
      return Legislator.new(reps.first)
    elsif reps.last["chamber"] == chamber
      return Legislator.new(reps.last)
    end
  end
end
