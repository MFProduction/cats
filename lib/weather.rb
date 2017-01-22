module Weather
  require 'open_weather'

  def self.get_forecast(date)
    options = {cnt: 40, units: "metric", APPID: Rails.application.secrets.open_weather_map_api}
    date = date.to_date
    begin
      OpenWeather::Forecast.city("Ljubljana", options)["list"].each do |forecast|
        if forecast["dt_txt"].to_date == date
          return forecast["weather"][0]
          break
         end
        end
        nil
    rescue
      nil
    end
  end
end
