require 'spec_helper'

RSpec.describe Weather do
  it 'has a version number' do
    expect(Weather::VERSION).not_to be nil
  end

  describe 'weather' do
    it 'returns weather' do
      stub_request(:get, 'https://www.metaweather.com/api/location/search/?query=moscow')
        .to_return(
          body: '[{"title":"Moscow","location_type":"City","woeid":2122265,"latt_long":"55.756950,37.614971"}]',
      )
      expect(Weather::Weather.get_weather_in_city('moscow')).to eq('woeid: 2122265')
    end
  end

  describe 'cli' do
    it 'returns weather', :focus do
      expect(Weather::CLI.weather('moscow')).to output('woeid: 2122265').to_stdout
    end
  end
end
