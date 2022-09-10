import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_test_2/core/services/services_locator.dart';
import 'package:weather_app_test_2/weather/presentation/controller/app_cubit.dart';
import 'package:weather_app_test_2/weather/presentation/controller/app_states.dart';
import 'package:weather_app_test_2/weather/presentation/screens/managelocation_screen.dart';

class WeatherMainScreen extends StatelessWidget {
  const WeatherMainScreen({Key? key}) : super(key: key);
  static const routeName = '/';


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(sl())..getWeatherData()..getLocation(),
      // lazy: false,
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state==AppLoadingState)
            AppCubit.get(context).getWeatherData();
        },
        builder: (context, state) {
          // var date=DateFormat.Hm().format(DateTime.now());
          // var time=DateFormat.jm().parse(date);
          var cubit = AppCubit.get(context);
          // String date= cubit.weather!.forCast.forecastDayEntity
          var sunset = DateTime.fromMillisecondsSinceEpoch(
                  cubit.weather!.forCast.forecastDayEntity[0].dateEpoch * 1000)
              .toUtc()
              .add(const Duration(hours: 0));
          var time = DateFormat("EE, hh:ss a").format(sunset);
          var hour=DateFormat("EE, hh a").format(sunset);
          var day = DateFormat("EEEE").format(sunset);
          // 'hh:mm a'

          if (state == AppInitialState ||
              state == AppLoadingState ||
              state == AppErrorState) {
            return CircularProgressIndicator();
          }
          return Scaffold(
            drawer: Container(
              padding: EdgeInsets.only(top: 23),
              child: Drawer(
                backgroundColor: Color.fromRGBO(49, 57, 67, 1),
                // rgb(49,57,67)
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          cubit.changeColor();
                        },
                        icon: Icon(Icons.nights_stay_outlined),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Favourite Location",
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),
                          Spacer(),

                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          SizedBox(width: 40,),

                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            cubit.weather!.location.cityName,
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),
SizedBox(width: 40,),
                         InkWell(
                           child: Row(
                             children: [
                               Image.asset('assets/images/sun.png',height: 20,width: 20,),
                               SizedBox(width: 5,),
                               Text(
                                 cubit.weather!.current.temp.toString() + "°",
                                 style:
                                 TextStyle(fontSize: 15, color: Colors.white ),
                               ),

                             ],
                           ),
                         )
                        ],
                      ),
                    ),
                    Divider(height: 2,
                    color: Colors.white,
                    endIndent: 20,
                    indent: 20,),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Other Locations",
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          SizedBox(width: 40,),

                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            // cubit.weather!.location.cityName,
                            "Paris",
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),
                          SizedBox(width: 40,),
                          InkWell(
                            child: Row(
                              children: [
                                Image.asset('assets/images/moon.gif',height: 20,width: 20,),
                                SizedBox(width: 5,),
                                Text(
                                  // cubit.weather!.current.temp.toString() + "°",
                                  "8" + "°",
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.white ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: AppCubit.get(context).textEditingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,color: Colors.white,),
                            suffixIcon: InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Search",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {

                                  AppCubit.get(context).getWeatherData();
                                  // if(  cubit.textEditingController.dispose==true){
                                  // Navigator.of(context).pop();
                                }),
                            hintText: "City Name",
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
borderRadius: BorderRadius.circular(20)
                      ),
                      width:250,
                      height: 35,
                      child: TextButton(
                        child: Text("Manage Location",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          // Navigator.of(context).pushNamed(ManageLocationScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Divider(height: 2,
                      color: Colors.white,
                      endIndent: 20,
                      indent: 20,),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Report Wrong Location",
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.headset_mic_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Contact Us",
                            style: TextStyle(color: Colors.white),
                          ),
                          // s(width: 10,),

                        ],
                      ),
                    ),





                  ],
                ),
              ),
            ),
            // rgb(130,170,232)
            backgroundColor: cubit.scaffoldColor,
            bottomNavigationBar: CustomScrollView(
              controller: cubit.scrollController,
              slivers: [
                SliverAppBar(
                  title: Row(
                    children: [
                      Text(
                        "${cubit.isCollapsed() ? cubit.weather!.location.cityName : ""}",
                        style: TextStyle(color: cubit.textColor),
                      ),
                      if(cubit.isCollapsed())
                      Icon(Icons.location_on_sharp,size: 18,color: cubit.textColor,),


                    ],
                  ),
                  elevation: 0,
                  // collapsedHeight: 80,
                  pinned: true,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.transparent),
                  backgroundColor: cubit.appbarColor,
                  expandedHeight: 300,
                  // floating: true,
                  // title: Text("El Hay El Asher",),

                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            cubit.weather!.current.temp.toString() + "°",
                            style:
                                TextStyle(fontSize: 45, color: cubit.textColor),
                          ),
                          Row(
                            children: [
                              // SizedBox(width:300,),
                              Text(cubit.weather!.location.cityName,
                                  style: TextStyle(
                                      fontSize: 20, color: cubit.textColor)),
                              Icon(Icons.location_on_sharp,size: 18,color: cubit.textColor,),

                              const Spacer(),
                              if (cubit.weather!.current.isDay == 1)
                                Image.asset(
                                  "assets/images/sun.png",
                                  height: 70,
                                  width: 70,
                                ),
                              if (cubit.weather!.current.isDay == 0)
                                Image.asset(
                                  "assets/images/moon.gif",
                                  height: 70,
                                  width: 70,
                                ),
                            ],
                          ),

                          Text(
                              '${cubit.weather!.forCast.forecastDayEntity[0].day.maxTemp}° / ${cubit.weather!.forCast.forecastDayEntity[0].day.minTemp}° Feels like ${cubit.weather!.current.feelsLike}°',
                              style: TextStyle(
                                  fontSize: 20, color: cubit.textColor)),
                          // const Text('Wed, 1.36 am°',
                          //     style: TextStyle(fontSize: 20)),
                          // DateFormat ("MM, hh:ss a).format(date);
                          Text('${time}',
                              style: TextStyle(
                                  fontSize: 20, color: cubit.textColor)),
                        ],
                      ),
                    ),
                    // title: ,
                    centerTitle: true,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // color: Color.fromRGBO(130, 170, 232 ,1),

                        height: 180,
                        // color: Colors.blue[100],
                        color: cubit.containerColor,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.hourModel!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              // margin: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   '${cubit.hourModel![index].temp.toString()}',
                                  //   style: TextStyle(fontSize: 18),
                                  // ),
                                  // .add(const Duration(hours: 2))
                                  Text(DateFormat(" h a").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          cubit.hourModel![index]
                                              .timeEpoch *
                                              1000)
                                          .toUtc()
                                          )),
                                  const SizedBox(height: 10),
                                  if (cubit.weather!.current.isDay == 1)
                                    Image.asset(
                                      "assets/images/sun.png",
                                      height: 25,
                                      width: 15,
                                    ),
                                  if (cubit.weather!.current.isDay == 0)
                                    Image.asset(
                                      "assets/images/moon.png",
                                      height: 25,
                                      width: 15,
                                    ),
                                  // Image.asset("assets/images/sun.png",
                                  //     height: 25),
                                  const SizedBox(height: 15),
                                  Text(
                                    '${cubit.hourModel![0].temp.toString()}°',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.water_drop, size: 13),
                                      // SizedBox(width: 3),
                                      Text(
                                        '${cubit.hourModel![0].chanceOfRain.toString()}',
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        color: cubit.containerColor,
                        child: Column(
                          children: const [
                            Text('Today\'s Temperature',
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: 4),
                            Text('Expect the same as yesterday',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 400,
                        color: cubit.containerColor,
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),

                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(DateFormat("EEEE").format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  cubit.dayModel![index]
                                                          .dateEpoch *
                                                      1000)
                                              .toUtc()
                                              .add(const Duration(hours: 2)))),
                                    ),
                                    Spacer(),
                                    const Icon(Icons.water_drop, size: 13),
                                    Text(
                                      '${cubit.dayModel![index].day.dailyChanceOfRain}%',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(width: 20,),
                                    // Image.asset("assets/images/sun.png",
                                    //     height: 25),
                                    // Image.asset("assets/images/sun.png",
                                    //     height: 25),
                                    // if(cubit.weather!.current.isDay==1)
                                    Image.asset(
                                      "assets/images/sun.png",
                                      height: 25,
                                    ),
                                    SizedBox(width: 20,),

                                    // if(cubit.weather!.current.isDay==0)
                                    //   Image.asset(
                                    //     "assets/images/moon.png",
                                    //     height: 25,
                                    //   ),
                                    // if(cubit.weather!.current.isDay==1)
                                    //   Image.asset(
                                    //     "assets/images/sun.png",
                                    //     height: 25,
                                    //   ),
                                    // if(cubit.weather!.current.isDay==0)
                                    Image.asset(
                                      "assets/images/moon.gif",
                                      height: 25,
                                    ),
                                    SizedBox(width: 20,),

                                    Text(
                                        "${cubit.dayModel![index].day.maxTemp}°"),
                                    SizedBox(width: 20,),

                                    Text(
                                        "${cubit.dayModel![index].day.minTemp}°"),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 8,
                                ),
                            itemCount: cubit.dayModel!.length),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 200,
                        color:cubit.containerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text("sunrise",
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                Text(
                                    "${cubit.weather!.forCast.forecastDayEntity[0].astro.sunrise}",
                                    style: TextStyle()),
                                Image.asset(
                                  "assets/images/sunrise.png",
                                  height: 120,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text("sunset",
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    "${cubit.weather!.forCast.forecastDayEntity[0].astro.sunset}",
                                    style: TextStyle()),
                                Image.asset(
                                  "assets/images/sunset.png",
                                  height: 120,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(12),
                        color:cubit.containerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/uv_index.png",
                                  height: 40,
                                ),
                                const Text('UV index'),
                                const Text('High'),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/wind.png",
                                  height: 40,
                                ),
                                const Text('Wind'),
                                Text(
                                    '${cubit.weather!.current.windSpeed} km/h'),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/humidity.png",
                                  height: 40,
                                ),
                                const Text('Humidity'),
                                Text('${cubit.weather!.current.humidity}%'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
