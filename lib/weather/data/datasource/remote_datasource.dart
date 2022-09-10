import 'package:dio/dio.dart';
import 'package:weather_app_test_2/core/error/exceptions.dart';
import 'package:weather_app_test_2/weather/data/models/weathermod.dart';

abstract class BaseWeatherRemoteDataSource{
  Future<ModelOfWeather> getWeatherByCityName(String cityName);
}
class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource{
  @override
  Future<ModelOfWeather> getWeatherByCityName(String cityName) async{

      // final response=await Dio().get("${AppConstance.baseUrl}/weather?q=cairo&appid=${AppConstance.appKey}");
      // final response=await Dio().get("https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=f63e5ac5dabc986ee761e19dd06ecf64");
      // final response=await Dio().get("https://api.weatherapi.com/v1/forecast.json?key=0c8504b31f3245c3bdf90222220809&q=london");
      // final response=await Dio().get("https://api.weatherapi.com/v1/forecast.json?key=0c8504b31f3245c3bdf90222220809&q=$cityName");
      final response=await Dio().get("https://api.weatherapi.com/v1/forecast.json?key=0c8504b31f3245c3bdf90222220809&q=${cityName}&days=8&aqi=no&alerts=no");
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        return  ModelOfWeather.fromJson(response.data);
      } else {
        throw ServerException(errorMessageModel: response.data);
      }


  }
}