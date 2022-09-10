
//
// class WeatherEntity{
//   final LocationEntity location;
//   final CurrentEntity current;
//   final ForCastEntity forCast;
//
//   const WeatherEntity({
//     required  this.location,
//     required    this.current,
//     required  this.forCast,
//   });
//
//
//
// }
//
//
// class LocationEntity{
//   String cityName;
//   String countryName;
//   double lat;
//   double lon;
//   String tzId;
//   int localtimeEpoch;
//   String localtime;
//
//   LocationEntity({
//     required this.cityName,
//     required this.countryName,
//     required this.lat,
//     required this.lon,
//     required this.tzId,
//     required this.localtimeEpoch,
//     required this.localtime,
//   });
//
//
// }
//
//
// class CurrentEntity{
//   double temp;
//   int isDay;
//   ConditionEntity condition;
//   double windSpeed;
//   double pressure;
//   int humidity;
//   double feelsLike;
//   double uv;
//
//   CurrentEntity({
//     required this.temp,
//     required this.isDay,
//     required this.condition,
//     required this.windSpeed,
//     required this.pressure,
//     required this.humidity,
//     required this.feelsLike,
//     required this.uv,
//   });
//
// //
//
// }
// class ConditionEntity{
//   String weatherState;
//   String weatherIcon;
//
//   ConditionEntity({
//     required this.weatherState,
//     required this.weatherIcon,
//   });
//
// //
//
// }
//
// class ForCastEntity{
//   List<ForecastDayEntity> forecastDayEntity;
//
//   ForCastEntity({
//     required this.forecastDayEntity,
//   });
//
//
// }
// class ForecastDayEntity {
//   String date;
//   int dateEpoch;
//   DayEntity day;
//   AstroEntity astro;
//   List<HourEntity> hourList;
//
//   ForecastDayEntity({
//     required this.date,
//     required this.dateEpoch,
//     required this.day,
//     required this.astro,
//     required this.hourList,
//   });
//
//
//
// }
// class DayEntity{
//   double maxTemp;
//   double minTemp;
//   int dailyChanceOfRain;
//
//   DayEntity({
//     required this.maxTemp,
//     required this.minTemp,
//     required this.dailyChanceOfRain,
//   });
//
// //
//
// }
// class AstroEntity{
//   String sunrise;
//   String sunset;
//
//   AstroEntity({
//     required this.sunrise,
//     required this.sunset,
//   });
//
//
// }
// class HourEntity{
//   String time;
//   int timeEpoch;
//   double temp;
//   int isDay;
// int chanceOfRain;
//
//   HourEntity({
//     required this.time,
//     required this.timeEpoch,
//     required this.temp,
//     required this.isDay,
//     required this.chanceOfRain,
//   });
//
//
// }



class WeatherEntity{
  final LocationEntity location;
  final CurrentEntity current;
  final ForCastEntity forCast;

  const WeatherEntity({
    required  this.location,
    required    this.current,
    required  this.forCast,
  });



}


class LocationEntity{
  String cityName;
  String countryName;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  LocationEntity({
    required this.cityName,
    required this.countryName,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });


}


class CurrentEntity{
  int temp;
  int isDay;
  ConditionEntity condition;
  int windSpeed;
  int pressure;
  int humidity;
  int feelsLike;
  int uv;

  CurrentEntity({
    required this.temp,
    required this.isDay,
    required this.condition,
    required this.windSpeed,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.uv,
  });

//

}
class ConditionEntity{
  String weatherState;
  String weatherIcon;

  ConditionEntity({
    required this.weatherState,
    required this.weatherIcon,
  });

//

}

class ForCastEntity{
  List<ForecastDayEntity> forecastDayEntity;

  ForCastEntity({
    required this.forecastDayEntity,
  });


}
class ForecastDayEntity {
  String date;
  int dateEpoch;
  DayEntity day;
  AstroEntity astro;
  List<HourEntity> hourList;

  ForecastDayEntity({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hourList,
  });



}
class DayEntity{
  int maxTemp;
  int minTemp;
  int dailyChanceOfRain;

  DayEntity({
    required this.maxTemp,
    required this.minTemp,
    required this.dailyChanceOfRain,
  });

//

}
class AstroEntity{
  String sunrise;
  String sunset;

  AstroEntity({
    required this.sunrise,
    required this.sunset,
  });


}
class HourEntity{
  String time;
  int timeEpoch;
  int temp;
  int isDay;
  int chanceOfRain;

  HourEntity({
    required this.time,
    required this.timeEpoch,
    required this.temp,
    required this.isDay,
    required this.chanceOfRain,
  });


}
