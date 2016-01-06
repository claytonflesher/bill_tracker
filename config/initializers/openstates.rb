OpenStates.configure do |config|
  config.api_key = ENV['API_KEY']
  config.logger = Rails.logger
end
