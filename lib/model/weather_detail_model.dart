class WeatherDetailModel {
  final String timezone;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final String main;
  final String description;
  final String icon;

  WeatherDetailModel(this.timezone, this.sunrise, this.sunset, this.temp, this.feelLike, this.pressure, this.humidity, this.dewPoint, this.uvi, this.clouds, this.windSpeed, this.windDeg, this.visibility, this.main, this.description, this.icon);

  factory WeatherDetailModel.fromJson(Map<String, dynamic> json) {

       return WeatherDetailModel(
            json['timezone'],
            json['current']['sunrise'],
            json['current']['sunset'],
            json['current']['temp'],
            json['current']['feels_like'],
            json['current']['pressure'],
            json['current']['humidity'],
            json['current']['dew_point'],
            json['current']['uvi'],
            json['current']['clouds'],
            json['current']['wind_speed'],
            json['current']['wind_deg'],
            json['current']['visibility'],
            json['current']['weather'][0]['main'],
            json['current']['weather'][0]['description'],
            json['current']['weather'][0]['icon'],
       );
  }

}