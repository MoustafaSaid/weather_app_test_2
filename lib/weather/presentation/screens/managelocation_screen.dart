// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app_test_2/core/services/services_locator.dart';
// import 'package:weather_app_test_2/weather/presentation/controller/app_cubit.dart';
// import 'package:weather_app_test_2/weather/presentation/controller/app_states.dart';
// import 'package:weather_app_test_2/weather/presentation/screens/home_page_screen.dart';
//
// class ManageLocationScreen extends StatelessWidget {
//   const ManageLocationScreen({Key? key}) : super(key: key);
//   static const routeName = 'manage_location';
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>AppCubit(sl()) ,
//       child: BlocListener(
//         listener:(context, state) {
//
//         },
//         child:  Scaffold(
//           body: Column(
//             children: [
//               // SizedBox(
//               //   height: 50,
//               // ),
//               // Container(
//               //     decoration: BoxDecoration(
//               //         color: Colors.grey,
//               //         borderRadius: BorderRadius.circular(20)),
//               //     margin: EdgeInsets.all(20),
//               //     child: TextFormField(
//               //       decoration: InputDecoration(
//               //         suffixIcon: ElevatedButton(
//               //             onPressed: () {
//               //               cubit.getWeatherData();
//               //               Navigator.of(context).pop();
//               //             },
//               //             child: Text("Ok")),
//               //       ),
//               //       controller: cubit.textEditingController,
//               //     )),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: AppCubit.get(context).textEditingController,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: InkWell(
//                           child: Container(
//                             padding: EdgeInsets.all(20),
//                             child: Text(
//                               "Search",
//                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           onTap: () {
//
//                             AppCubit.get(context).getWeatherData();
//                             // if(  cubit.textEditingController.dispose==true){
//                             Navigator.of(context).pushReplacementNamed(WeatherMainScreen.routeName);
//                           }),
//                       hintText: "City Name",
//                       hintStyle: TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.blue))),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
