require "open-uri"
require "json"
class OpenStatesWrapper

  def self.call(call_type:, url_parameters: {})
    uri = "http://openstates.org/api/v1/"
    parameters = self.get_parameters(url_parameters)
    case call_type
    when :geo_lookup
      url = "legislators/geo#{parameters}"
    end
    query = uri + url
    JSON.parse(open(query).read)
  end

  private

  def self.get_parameters(url_parameters)
    results = "?apikey=#{ENV["API_KEY"]}"
    unless url_parameters.empty?
      url_parameters.each do |key, value|
        results = results + "&" + key + "=" + value
      end
    end
    results
  end
end
