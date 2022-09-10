import 'package:dartz/dartz.dart';
import 'package:weather_app_test_2/core/error/failure.dart';
import 'package:weather_app_test_2/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app_test_2/weather/data/models/weathermod.dart';

abstract class BaseWeatherRepository{
  final BaseWeatherRemoteDataSource baseRemoteDataSource;
  BaseWeatherRepository(this.baseRemoteDataSource);
  Future<Either<Failure,ModelOfWeather>>getWeatherByCityName(String cityName);
  // Future<Either<Failure,List<Weather>>> getNowPlayingMovies();

}