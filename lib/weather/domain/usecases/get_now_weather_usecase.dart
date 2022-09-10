import 'package:dartz/dartz.dart';
import 'package:weather_app_test_2/core/error/failure.dart';
import 'package:weather_app_test_2/weather/data/models/weathermod.dart';
import 'package:weather_app_test_2/weather/domain/repository/base_weather_repository.dart';

class GetNowWeatherUseCase{
  final BaseWeatherRepository baseWeatherRepository;
  GetNowWeatherUseCase(this.baseWeatherRepository);
  Future<Either<Failure,ModelOfWeather>> execute(String cityName)async{
    return await baseWeatherRepository.getWeatherByCityName( cityName);
  }
}