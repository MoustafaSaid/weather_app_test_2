

import 'package:get_it/get_it.dart';
import 'package:weather_app_test_2/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app_test_2/weather/data/repository/weather_repository.dart';
import 'package:weather_app_test_2/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app_test_2/weather/domain/usecases/get_now_weather_usecase.dart';
import 'package:weather_app_test_2/weather/presentation/controller/app_cubit.dart';

final sl=GetIt.instance;
class ServiceLocator{
  void init(){

///bloc
sl.registerFactory(() => AppCubit(sl()));
    /// Use Case
sl.registerLazySingleton(() => GetNowWeatherUseCase(sl()));
// sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
// sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));
    /// Data Source
    sl.registerLazySingleton<BaseWeatherRemoteDataSource>(() => WeatherRemoteDataSource());
  }
}