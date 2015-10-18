require "open-uri"
require "json"
require "erb"
class OpenStatesWrapper

  def self.call(call_type:, url_parameters: {})
    parameters = arrange_parameters(url_parameters)
    url        = call_types(parameters: parameters)[call_type]
    query      = uri + url
    JSON.parse(open(query).read)
  rescue OpenURI::HTTPError
  end

  def self.arrange_parameters(url_parameters)
    results = "?apikey=#{ENV["API_KEY"]}"
    url_parameters.inject(results) { |memo, (k, v)| "#{memo}&#{ERB::Util.u(k)}=#{ERB::Util.u(v)}" }
  end

  def self.uri
    "http://openstates.org/api/v1/"
  end

  def self.call_types(parameters:)
    {geo_lookup: "legislators/geo#{parameters}"}
  end
  private_class_method :arrange_parameters, :uri, :call_types
end
