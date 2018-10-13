require 'spec_helper'

RSpec.describe Weather do
  before(:each) do
    stub_request(:get, 'https://www.metaweather.com/api/location/search/?query=moscow')
      .to_return(
        body: '[{"title":"Moscow","location_type":"City","woeid":2122265,"latt_long":"55.756950,37.614971"}]',
      )
  end

  describe 'weather' do
    it 'returns weather' do
      expect(Weather::Weather.get_weather_in_city('moscow')).to eq('woeid: 2122265')
    end
  end

  describe 'cli' do
    command 'weather weather moscow'
    its(:stdout) { is_expected.to include('woeid: 2122265') }
  end
end
