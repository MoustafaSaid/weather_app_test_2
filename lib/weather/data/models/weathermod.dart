import 'package:weather_app_test_2/weather/domain/entities/weatheren.dart';

class ModelOfWeather extends WeatherEntity {
  const ModelOfWeather(
      { required super.location,
        required   super.current,
        required  super.forCast});

  factory ModelOfWeather.fromJson(Map<String, dynamic> json) {
    return ModelOfWeather(
      current:  CurrentModel.fromJson(json["current"]),
      forCast: ForCastModel.fromJson(json["forecast"]),
      location:LocationModel.fromJson(json["location"]),
    );
  }
}

class CurrentModel extends CurrentEntity {
  CurrentModel(
      {required super.temp,
      required super.isDay,
      required super.condition,
      required super.windSpeed,
      required super.pressure,
      required super.humidity,
      required super.feelsLike,
      required super.uv});

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
        temp: json["temp_c"].round(),
        isDay: json["is_day"],
        condition: ConditionModel.fromJson(json["condition"]),
        windSpeed: json["wind_kph"].round(),
        pressure: json["pressure_mb"].round(),
        humidity: json["humidity"],
        feelsLike: json["feelslike_c"].round(),
        uv: json["uv"].round());
  }
}

class LocationModel extends LocationEntity {
  LocationModel(
      {required super.cityName,
      required super.countryName,
      required super.lat,
      required super.lon,
      required super.tzId,
      required super.localtimeEpoch,
      required super.localtime});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        cityName: json["name"],
        countryName: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"]);
  }
}

class ConditionModel extends ConditionEntity {
  ConditionModel({required super.weatherState, required super.weatherIcon});

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
        weatherState: json["text"], weatherIcon: json["icon"]);
  }
}

class ForCastModel extends ForCastEntity {
  ForCastModel({required super.forecastDayEntity});

  factory ForCastModel.fromJson(Map<String, dynamic> json) {
    return ForCastModel(forecastDayEntity: List<ForecastDayModel>.from(json["forecastday"].map((x) => ForecastDayModel.fromJson(x))),);
  }
}

class ForecastDayModel extends ForecastDayEntity {
  ForecastDayModel(
      {required super.date,
      required super.dateEpoch,
      required super.day,
      required super.astro,
      required super.hourList});

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
        date: json["date"],
        dateEpoch: json["date_epoch"],
        day: DayModel.fromJson(json["day"]),
        astro: AstroModel.fromJson(json["astro"]),
        hourList: List<HourModel>.from(
    json["hour"]?.map((x) => HourModel.fromJson(x))));
  }
}

class DayModel extends DayEntity {
  DayModel(
      {required super.maxTemp,
      required super.minTemp,
      required super.dailyChanceOfRain});

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
        maxTemp: json["maxtemp_c"].round(),
        minTemp: json["mintemp_c"].round(),
        dailyChanceOfRain: json["daily_chance_of_rain"]);
  }
}

class AstroModel extends AstroEntity {
  AstroModel({required super.sunrise, required super.sunset});

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    return AstroModel(sunrise: json["sunrise"], sunset: json["sunset"]);
  }
}

class HourModel extends HourEntity {
  HourModel(
      {required super.time,
      required super.timeEpoch,
      required super.temp,
      required super.isDay,
      required super.chanceOfRain});

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
        time: json["time"],
        timeEpoch: json["time_epoch"],
        temp: json["temp_c"].round(),
        isDay: json["is_day"],
        chanceOfRain: json["chance_of_rain"]);
  }
}
