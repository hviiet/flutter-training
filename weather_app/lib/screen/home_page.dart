import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/blocs/city/city_cubit.dart';
import 'package:weather_app/blocs/city/city_state.dart';
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

        final cityData = state.citiesData[0];
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
                                Text('${cityData.weather!.temp_c}°C', style: TextStyle(fontWeight: FontWeight.bold),),
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
        
                        //forecard
                        Text("Forecast", style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: min(cityData.airQuality!.forecast.length, cityData.weather!.forecast.length),
                            itemBuilder: (context, index) {
                              // final data = mockData[index % mockData.length];
                              return ForecastCard(
                                aqi: cityData.airQuality!.forecast[index].avg.toStringAsFixed(0),
                                temp: cityData.weather!.forecast[index].avgtemp_c.toString(),
                                day: "MON",
                                iconUrl: cityData.weather!.forecast[index].conditionIcon,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
        
                        //dot
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4, 
                            (index){
                              return Container(
                                margin: EdgeInsets.all(4),
                                width: index == 0? 20:8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: index == 0? Colors.blue:Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            }
                          ),
                        ),
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
                        temp: cityData.weather!.temp_c.toString(),
                        iconUrl: cityData.weather!.conditionIcon,
                        title: "Work",
                        position: "Nguyen Van Linh, Da Nang",
                      ),
        
                      HomeCard(
                        aqi: cityData.airQuality!.aqi.toStringAsFixed(0),
                        temp: cityData.weather!.temp_c.toString(),
                        iconUrl: cityData.weather!.conditionIcon,
                        title: "Home",
                        position: "Le Loi, Da Nang",
                      ),
                    ],
                  ),
        
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allCityData.length,
                      itemBuilder: (context, index){
                        return WeatherCard(
                          street: allCityData[index].weather!.location,
                          city: allCityData[index].weather!.location,
                          aqi: allCityData[index].airQuality!.aqi.toStringAsFixed(0),
                          temp: allCityData[index].weather!.temp_c.toString(),
                          iconUrl: allCityData[index].weather!.conditionIcon,
                        );
                      }
                    ),
                  ),
        
                  SizedBox(height: 10,),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(min(4, allCityData.length), (index){
                        return Container(
                          margin: EdgeInsets.all(4),
                          width: index == 0? 20:8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: index == 0? Colors.blue:Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }
                    ),
                  ),
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

class ForecastCard extends StatelessWidget {
  const ForecastCard({
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

class WeatherCard extends StatelessWidget {
  final String street;
  final String city;
  final String aqi;
  final String temp;
  final String iconUrl;

  const WeatherCard({
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
                    Text(temp, style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Image.network(iconUrl, width: 20, height: 20,),
                  ],
                ),
              ],
            ),
          );
  }
}