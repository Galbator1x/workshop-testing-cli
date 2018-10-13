require 'thor'

module Weather
  class CLI < Thor
    desc 'weather CITY', 'returns weather in CITY'
    def weather(city)
      puts Weather::Weather.get_weather_in_city(city)
    end
  end
end
