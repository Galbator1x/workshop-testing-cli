require 'weather/version'
require 'open-uri'
require 'json'

module Weather
  class Weather
    WEATHER_API_URL = 'https://www.metaweather.com/api/location/search/'.freeze

    def self.get_weather_in_city(city)
      html = open("#{WEATHER_API_URL}?query=#{city}").read
      json_response = JSON.parse(html, symbolize_names: true).first
      "woeid: #{json_response[:woeid]}"
    end
  end
end
