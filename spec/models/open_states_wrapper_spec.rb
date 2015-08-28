require "rails_helper"

RSpec.describe OpenStatesWrapper, type: :model do
  it "looks up legislators by latitude and longitude" do
    result = OpenStatesWrapper.call(
      call_type: :geo_lookup, 
      url_parameters: { 
        "long" => "-74.04450039999999",
        "lat"  => "40.6892494"
      }
    )
    expect(result).to be_an(Array)
    expect(result.empty?).to be_falsy
  end
end
