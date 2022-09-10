import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app_test_2/core/error/failure.dart';
import 'package:weather_app_test_2/weather/data/models/weathermod.dart';
import 'package:weather_app_test_2/weather/domain/entities/weatheren.dart';
import 'package:weather_app_test_2/weather/domain/usecases/get_now_weather_usecase.dart';
import 'package:weather_app_test_2/weather/presentation/controller/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  static AppCubit get(context) => BlocProvider.of(context);
  ModelOfWeather? weather;

  final GetNowWeatherUseCase getNowWeatherUseCase;

  AppCubit(this.getNowWeatherUseCase) : super(AppInitialState());
  TextEditingController textEditingController=TextEditingController();
  ScrollController scrollController = ScrollController();
  bool result=false;

  isCollapsed() {
     // scrollController.notifyListeners();
     result=  scrollController.hasClients && scrollController.offset > (230 - 56.0);
    // if(result!=false) {

     emit(AppBarClosedState());
     // }
     // print(result);

     return result;

  }

  ThemeData themeData=ThemeData();
//   changeTheme(){
//  final light = ThemeData(
//   primaryColor: Colors.blueAccent,
//   backgroundColor: Colors.white,
//   brightness: Brightness.light,
// );
//  final dark = ThemeData(
//   // primaryColor: darkGreyClr,
//   // backgroundColor: darkGreyClr,
//   brightness: Brightness.dark,
// );
//   }
  var textColor=Colors.black;
  var firsContainerColor=Color.fromRGBO(132, 168, 230, 1);
  var containerColor= Colors.blue[50];
  Color appbarColor=Colors.blueAccent;
  Color scaffoldColor=Colors.blueAccent;

  // var sunset = DateTime.fromMillisecondsSinceEpoch(
  //     weather!.forCast.forecastDayEntity[0].dateEpoch * 1000)
  //     .toUtc()
  //     .add(const Duration(hours: 2));

  changeColor(){
    textColor=textColor==Colors.black?Colors.white:Colors.black;
    appbarColor=appbarColor==Colors.blueAccent?Colors.black:Colors.blueAccent;
    scaffoldColor=scaffoldColor==Colors.blueAccent?Colors.black:Colors.blueAccent;
    containerColor=containerColor==Colors.blue[50]?Colors.white70:Colors.blue[50];
    emit(AppChangeColorState());

  }

  List<HourEntity>? hourModel;
  List<ForecastDayEntity>? dayModel;
  // Map<String,dynamic> cityName=OpenFile("assets/city_map", true) as Map<String, dynamic>;
  // searchCityName(String cityName){
  //   cityName.map((city, value) {
  //
  //   });
  // }
// getHourWeather()async{
//   print(hourModel);
// }

//    _getWeather()async {
//     final result = await getNowWeatherUseCase.execute("london");
// return weather
//      result.fold((l) {
//       print(l.message);
//       emit(AppErrorState());
//     }, (r) {
//     weather=r;
//     emit(AppLoadedState());
//
//    });
//   }

  getWeatherData() async {
    emit(AppLoadingState());
    final result = await getNowWeatherUseCase.execute( textEditingController.text??"cairo");
    weather = result.fold((l) => null, (r) => r);
    hourModel= weather!.forCast.forecastDayEntity[0].hourList;
    dayModel=weather!.forCast.forecastDayEntity;

    emit(AppLoadedState());

    //
    //  return result.fold((l) {
    //  emit(AppErrorState());
    //  print("error");
    //  return ServerFailure(l.message);
    //  }, (r) {
    //  emit(AppLoadingState());
    //  print("success");
    //  weather=r;
    //  emit(AppLoadedState());
    //  return weather;
    // });
  }
  manageLocation()async{
    final result = await getNowWeatherUseCase.execute(    textEditingController.text??"cairo"
    );
    weather = result.fold((l) => null, (r) => r);
    hourModel= weather!.forCast.forecastDayEntity[0].hourList;
    dayModel=weather!.forCast.forecastDayEntity;
    emit(AppLoadedState());
  }

  Location location = Location();
  bool _serviceEnabled = false;
  late PermissionStatus _permissionGranted;
  late LocationData locationData;
  bool isListenLocation = false;
  bool isGetLocation = false;

  getLocation() async {
// Location location=Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    isGetLocation = true;
    emit(AppGetLocationSuccessState());

    print(locationData.latitude);
    print(locationData.longitude);
  }
}
