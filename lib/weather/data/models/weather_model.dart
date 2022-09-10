// import 'package:weather_app_test/weather/domain/entities/weather.dart';
//
// class WeatherModel extends Weather {
//  const WeatherModel(
//       {required super.temp,
//       required super.feelsLike,
//       required super.tempMin,
//       required super.tempMax,
//       required super.pressure,
//       required super.humidity,
//       required super.windSpeed,
//       required super.countryName,
//       required super.cityName});
//
//   // factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//   //       temp: json['main']["temp"],
//   //       feelsLike: json["main"]["feels_like"],
//   //       tempMin: json["main"]["temp_min"],
//   //       tempMax: json["main"]["temp_max"],
//   //       pressure: json["main"]["pressure"],
//   //       humidity: json["main"]["humidity"],
//   //       windSpeed: json["wind"]["speed"],
//   //   countryName: json["sys"]["country"],
//   //
//   //   cityName: json["name"],
//   //     );
//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         temp: json['current']["temp_c"],
//         feelsLike: json["current"]["feelslike_c"],
//         tempMin: json['day']['maxtemp_c'],
//         tempMax: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
//         pressure: json["current"]["pressure_mb"],
//         humidity: json["current"]["humidity"],
//         windSpeed: json["current"]["wind_kph"],
//     countryName: json["location"]["country"],
//
//     cityName: json["location"]["name"],
//       );
// }
