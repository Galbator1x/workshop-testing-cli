require 'thor'
module Weather
  class CLI < Thor
    def weather(city)
      puts Weather::Weather.get_weather_in_city(city)
    end
  end
end
