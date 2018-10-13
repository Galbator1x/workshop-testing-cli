require 'spec_helper'

RSpec.describe Weather do
  it 'has a version number' do
    expect(Weather::VERSION).not_to be nil
  end

  it 'returns weather', :focus do
    stub_request(:get, 'https://www.metaweather.com/api/location/search/?query=moscow')
      .with(
        headers: {
          'Accept': '*/*',
          'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent': 'Ruby'
        }
      )
      .to_return(
        status: 200,
        body: '[{"title":"Moscow","location_type":"City","woeid":2122265,"latt_long":"55.756950,37.614971"}]',
        headers: {}
      )
    expect(Weather::Weather.get_weather_in_city('moscow')).to eq('woeid: 2122265')
  end
end
