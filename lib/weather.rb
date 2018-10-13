require 'weather/version'
require 'httparty'
require 'json'

module Weather
  class Weather
    WEATHER_API_URL = 'https://www.metaweather.com/api/location/search/'.freeze

    def self.get_weather_in_city(city)
      html = HTTParty.get("#{WEATHER_API_URL}?query=#{city}")
      json_response = JSON.parse(html.body, symbolize_names: true).first
      "woeid: #{json_response[:woeid]}"
    end
  end
end
