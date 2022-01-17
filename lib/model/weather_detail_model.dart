class WeatherDetailModel {
  final String timezone;
  final DateTime sunrise;
  final DateTime sunset;
  final num temp;
  final num feelLike;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num uvi;
  final num clouds;
  final num visibility;
  final num windSpeed;
  final num windDeg;
  final String main;
  final String description;
  final String icon;

  WeatherDetailModel(this.timezone, this.sunrise, this.sunset, this.temp, this.feelLike, this.pressure, this.humidity, this.dewPoint, this.uvi, this.clouds, this.windSpeed, this.windDeg, this.visibility, this.main, this.description, this.icon);

  factory WeatherDetailModel.fromJson(Map<String, dynamic> json) {
        num temp = json['current']['temp'];
        num feelLike = json['current']['feels_like'];
       return WeatherDetailModel(
            json['timezone'],
            DateTime.fromMillisecondsSinceEpoch(json['current']['sunrise'] * 1000),
            DateTime.fromMillisecondsSinceEpoch(json['current']['sunset']* 1000),
            temp.round(),
            feelLike.round(),
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