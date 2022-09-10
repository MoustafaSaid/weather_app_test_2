import 'package:dartz/dartz.dart';
import 'package:weather_app_test_2/core/error/exceptions.dart';
import 'package:weather_app_test_2/core/error/failure.dart';
import 'package:weather_app_test_2/weather/data/models/weathermod.dart';
import 'package:weather_app_test_2/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository{
  WeatherRepository(super.baseRemoteDataSource);

  @override
  Future<Either<Failure,ModelOfWeather>> getWeatherByCityName(String cityName)async {
    final result=await baseRemoteDataSource.getWeatherByCityName(  cityName);
    try{

      return Right(result);
    }on ServerException catch(failure){

      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}