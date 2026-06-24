import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/blocs/city/city_cubit.dart';
import 'package:weather_app/blocs/city/city_state.dart';
import 'package:weather_app/extension/weather_extension.dart';
import 'package:weather_app/models/city_data.dart';
import 'package:weather_app/providers/authProvider.dart';
import 'package:weather_app/screen/location_details/location_detail.dart';
import 'package:weather_app/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Authprovider>();
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if(state.isLoading && state.citiesData.isEmpty){
          return const Center(child: CircularProgressIndicator(),);
        }

        final cityData = state.citiesData["danang"];
        final allCityData = state.citiesData.values.toList();
        // final cityCount = state.citiesData.length;
        if(cityData == null){
          return const Center(child: Text("No data available"),);
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //welcome header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back 👋", style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text(auth.currentUser?.name?? "Anamoul", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                    ],
                  ),
        
                  SizedBox(height: 20,),
        
                  //main weather card
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //header
                        Row(
                          children: [
                            Icon(Icons.gps_fixed, color: Colors.blue,),
                            SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                                Text(cityData.weather!.location, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(cityData.weather!.location, style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            // Icon(Icons.cloud),
                            Image.network(cityData.weather!.conditionIcon, width: 30, height: 30,),
                            SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                                Text('${cityData.weather!.temp_c.toStringAsFixed(0)}°C', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(cityData.weather!.conditionText , style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Spacer(),
                            Text(cityData.airQuality!.aqi.toStringAsFixed(0), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,),),
                            Text(" AQI", style: TextStyle(color: Colors.grey),),
                            SizedBox(width: 8,),
                            // Icon(Icons.mood, color: Colors.green,),
                            Utils().mapAQIToIcon(cityData.airQuality!.aqi.toString()),
                          ],
                        ),
        
                        SizedBox(height: 20,),
        
                        //forecart
                        ForecastCard(cityData: cityData),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
        
                  //work, home
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        aqi: cityData.airQuality!.aqi.toStringAsFixed(0),
                        temp: cityData.weather!.temp_c.toStringAsFixed(0),
                        iconUrl: cityData.weather!.conditionIcon,
                        title: "Work",
                        position: "Nguyen Van Linh, Da Nang",
                      ),
        
                      HomeCard(
                        aqi: cityData.airQuality!.aqi.toStringAsFixed(0),
                        temp: cityData.weather!.temp_c.toStringAsFixed(0),
                        iconUrl: cityData.weather!.conditionIcon,
                        title: "Home",
                        position: "Le Loi, Da Nang",
                      ),
                    ],
                  ),
        
                  SizedBox(height: 10,),
                  
                  WeatherCard(allCityData: allCityData),

                  SizedBox(height: 20,),
        
                  //Airqualitycard
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.priority_high, color: Colors.blue,),
                      title: Text("Detail Air Quality", ),
                      trailing: Icon(Icons.chevron_right, color: Colors.blue,),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LocationDetail()));
                      },
                    ),
                  ),
        
        
                ],
              ),
            ) ,
          ),
        );
      }
    );
  }
}

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
    required this.day,
    required this.aqi,
    required this.temp,
    required this.iconUrl,
  });

  final String day;
  final String aqi;
  final String temp;
  final String iconUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      margin: EdgeInsets.only(right: 8, ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day),
          SizedBox(height: 8),
          // Icon(Icons.mood, size: 20, color: Colors.green,),
          Utils().mapAQIToIcon(aqi),
          Text("$aqi AQI"),

          Divider(),

          SizedBox(height: 8),

          // Icon(Icons.cloud),
          Image.network(iconUrl, width: 20, height: 20,),

          Text("$temp°C"),
        ],
      ),
    );
  }
}

//forecast card
class ForecastCard extends StatefulWidget {
  final CityData cityData;
  const ForecastCard({super.key, required this.cityData});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}
class _ForecastCardState extends State<ForecastCard> {
  final PageController pageController = PageController(viewportFraction: 0.2);
  int currentPage = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
    totalItems = min(widget.cityData.airQuality!.forecast.length, widget.cityData.weather!.forecast.length);
    pageController.addListener((){
      setState(() {
        double page = pageController.page ?? 0;
        currentPage = (page).round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Forecast", style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        SizedBox(
          height: 140,
          child: ListView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: totalItems,
            itemBuilder: (context, index) {
              return ForecastItem(
                aqi: widget.cityData.airQuality!.forecast[index].avg.toStringAsFixed(0),
                temp: widget.cityData.weather!.forecast[index].day.avgtemp_c.toStringAsFixed(0),
                day: Utils().mapDayInWeek(widget.cityData.weather!.forecast[index].date.weekday),
                iconUrl: widget.cityData.weather!.forecast[index].day.condition.conditionIconUrl,
              );
            },
          ),
        ),
        SizedBox(height: 20,),

        //dot
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalItems - 4 > 0? totalItems - 4 : 0, 
            (index){
              return Container(
                margin: EdgeInsets.all(4),
                width: index == currentPage? 20:8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == currentPage? Colors.blue:Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}




class HomeCard extends StatelessWidget {
  final String aqi;
  final String temp;
  final String title;
  final String position;
  final String iconUrl;

  const HomeCard({
    super.key,
    required this.aqi,
    required this.temp,
    required this.title,
    required this.position,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12),),
                Text(position, style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Utils().mapAQIToIcon(aqi),
                    SizedBox(width: 4,),
                    Text(aqi, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    // SizedBox(width: 8,),
                    Text(" AQI", style: TextStyle(color: Colors.grey, fontSize: 12),),
                    // Spacer(),
                    SizedBox(width: 15,),
                    // Icon(Icons.cloud, size: 20,),
                    Image.network(iconUrl, width: 20, height: 20,),
                    SizedBox(width: 8,),
                    Text(temp, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    Text("°C", style: TextStyle(color: Colors.grey, fontSize: 12),),
                  ],
                ),
              ],
            ),
          );
  }
}

class CityWeatherItem extends StatelessWidget {
  final String street;
  final String city;
  final String aqi;
  final String temp;
  final String iconUrl;

  const CityWeatherItem({
    super.key, 
    required this.street, 
    required this.city, 
    required this.aqi, 
    required this.temp,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 200,
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(street, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(city, style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.bookmark, color: Colors.deepPurpleAccent,),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Utils().mapAQIToIcon(aqi),
                    SizedBox(width: 5,),
                    Text(aqi, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("AQI", style: TextStyle(fontSize: 12, color: Colors.grey,),),

                    Spacer(),
                    Text('$temp°C', style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Image.network(iconUrl, width: 20, height: 20,),
                  ],
                ),
              ],
            ),
          );
  }
}

class WeatherCard extends StatefulWidget {
  final List<CityData> allCityData;
  const WeatherCard({super.key, required this.allCityData});

  @override
  State<WeatherCard> createState() => WeatherCardState();
}

class WeatherCardState extends State<WeatherCard> {
  final PageController pageController = PageController(viewportFraction: 0.5);
  int currentPage = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
    totalItems = widget.allCityData.length;
    pageController.addListener((){
      setState(() {
        double page = pageController.page ?? 0;
        currentPage = (page).round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: totalItems,
            itemBuilder: (context, index){
              return CityWeatherItem(
                street: widget.allCityData[index].weather!.location,
                city: widget.allCityData[index].weather!.location,
                aqi: widget.allCityData[index].airQuality!.aqi.toStringAsFixed(0),
                temp: widget.allCityData[index].weather!.temp_c.toStringAsFixed(0),
                iconUrl: widget.allCityData[index].weather!.conditionIcon,
              );
            }
          ),
        ),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate( totalItems, (index){
              return Container(
                margin: EdgeInsets.all(4),
                width: index == currentPage ? 20:8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == currentPage ? Colors.blue:Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}