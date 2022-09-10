import 'package:flutter/material.dart';
import 'package:weather_app_test_2/core/services/services_locator.dart';
import 'package:weather_app_test_2/weather/presentation/controller/app_cubit.dart';
import 'package:weather_app_test_2/weather/presentation/screens/home_page_screen.dart';
import 'package:weather_app_test_2/weather/presentation/screens/managelocation_screen.dart';

void main() {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  // AppCubit(sl()).getWeatherData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const WeatherMainScreen(),
      routes: {
        // '/':(context)=>WeatherMainScreen(),
// ManageLocationScreen.routeName:(context)=>ManageLocationScreen()
      },
    );
  }
}
