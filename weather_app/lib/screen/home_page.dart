import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/authProvider.dart';
import 'package:weather_app/screen/location_details/location_detail.dart';
import 'package:weather_app/utils/utils.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final mockData = [
    {
      "day": "MON",
      "aqi": "30",
      "temp": "20",
    },
    {
      "day": "MON",
      "aqi": "50",
      "temp": "21",
    },
    {
      "day": "WEN",
      "aqi": "40",
      "temp": "19",
    },
    {
      "day": "THU",
      "aqi": "60",
      "temp": "22",
    },
    {
      "day": "FRI",
      "aqi": "27",
      "temp": "18",
    },
    {
      "day": "SAT",
      "aqi": "155",
      "temp": "20",
    },
    {
      "day": "SUN",
      "aqi": "400",
      "temp": "21",
    },
    {
      "day": "MON",
      "aqi": "30",
      "temp": "20",
    },
    {
      "day": "MON",
      "aqi": "50",
      "temp": "21",
    },
    {
      "day": "WEN",
      "aqi": "40",
      "temp": "19",
    },
    {
      "day": "THU",
      "aqi": "60",
      "temp": "22",
    },
    {
      "day": "FRI",
      "aqi": "27",
      "temp": "18",
    },
    {
      "day": "SAT",
      "aqi": "215",
      "temp": "20",
    },
    {
      "day": "SUN",
      "aqi": "22",
      "temp": "21",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Authprovider>();
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
                            Text("Church Street Square", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("Bimingham", style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.cloud),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text("19°C", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("Rain Shower", style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        Text("3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,),),
                        Text("AQI", style: TextStyle(color: Colors.grey),),
                        SizedBox(width: 8,),
                        Icon(Icons.mood, color: Colors.green,),
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
                        itemCount: mockData.length,
                        itemBuilder: (context, index) {
                          final data = mockData[index % mockData.length];
                          return ForecastCard(
                            aqi: data["aqi"]!,
                            temp: data["temp"]!,
                            day: data["day"]!,
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
                    aqi: "3",
                    temp: "25",
                    title: "Work",
                    position: "Coventry ST, Birmingham",
                  ),

                  HomeCard(
                    aqi: "5",
                    temp: "21",
                    title: "Home",
                    position: "Edmund ST, Birmingham",
                  ),
                ],
              ),

              SizedBox(height: 10,),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return WeatherCard(
                      street: "Church Street Square",
                      city: "Birmingham",
                      aqi: "5",
                      temp: "21°C",
                    );
                  }
                ),
              ),

              SizedBox(height: 10,),

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
}

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.day,
    required this.aqi,
    required this.temp,
  });

  final String day;
  final String aqi;
  final String temp;


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

          Icon(Icons.cloud),

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

  const HomeCard({
    super.key,
    required this.aqi,
    required this.temp,
    required this.title,
    required this.position
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
                Text(position, style: TextStyle(color: Colors.grey, fontSize: 10)),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Utils().mapAQIToIcon(aqi),
                    SizedBox(width: 8,),
                    Text(aqi, style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 8,),
                    Text("AQI", style: TextStyle(color: Colors.grey,),),
                    // Spacer(),
                    SizedBox(width: 15,),
                    Icon(Icons.cloud, size: 20,),
                    SizedBox(width: 8,),
                    Text(temp, style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text("°C", style: TextStyle(color: Colors.grey,),),
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

  const WeatherCard({
    super.key, 
    required this.street, 
    required this.city, 
    required this.aqi, 
    required this.temp
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
                    Icon(Icons.sunny_snowing, color: Colors.orange,),
                  ],
                ),
              ],
            ),
          );
  }
}