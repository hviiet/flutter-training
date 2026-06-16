import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/authProvider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final dayInWeek = ["MON", "TUE", "WEN", "THU", "FRI", "SAT", "SUN"];

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Authprovider>();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        itemCount: 10,
                        itemBuilder: (context, index) {
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
                                Text(dayInWeek[index%7]),
                                SizedBox(height: 8),
                                Icon(Icons.mood, size: 20, color: Colors.green,),
                                Text("1 AQI"),

                                Divider(),

                                SizedBox(height: 8),

                                Icon(Icons.cloud),

                                Text("20°C"),
                              ],
                            ),
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
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Work", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12),),
                        Text("Coventry ST, Birmingham", style: TextStyle(color: Colors.grey, fontSize: 10)),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.mood, color: Colors.green, size: 20,),
                            SizedBox(width: 8,),
                            Text("3", style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(width: 8,),
                            Text("AQI", style: TextStyle(color: Colors.grey,),),
                            // Spacer(),
                            SizedBox(width: 15,),
                            Icon(Icons.cloud, size: 20,),
                            SizedBox(width: 8,),
                            Text("25", style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("°C", style: TextStyle(color: Colors.grey,),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        Text("Coventry ST, Birmingham", style: TextStyle(color: Colors.grey, fontSize: 10)),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.mood, color: Colors.green, size: 20,),
                            SizedBox(width: 8,),
                            Text("3", style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(width: 8,),
                            Text("AQI", style: TextStyle(color: Colors.grey,),),
                            // Spacer(),
                            SizedBox(width: 15,),
                            Icon(Icons.cloud, size:  20,),
                            SizedBox(width: 8,),
                            Text("25", style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("°C", style: TextStyle(color: Colors.grey,),),
                          ],
                        ),
                      ],
                    ),
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
                                  Text("Edmund Street", style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Birmingham", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.bookmark, color: Colors.deepPurpleAccent,),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(Icons.mood, color: Colors.orange,),
                              SizedBox(width: 5,),
                              Text("5 ", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("AQI", style: TextStyle(fontSize: 12, color: Colors.grey,),),

                              Spacer(),
                              Text("21°C", style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5,),
                              Icon(Icons.sunny_snowing, color: Colors.orange,),
                            ],
                          ),
                        ],
                      ),
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
                ),
              ),


            ],
          ),
        ) ,
      ),
    );
  }
}