import 'package:flutter/material.dart';
import 'package:flutter_application_1/event/fetch_weather.dart';
import 'package:flutter_application_1/models/forecast_item_data.dart';
import 'package:flutter_application_1/pages/home/add_place.dart';
import 'package:flutter_application_1/pages/home/forecast_item.dart';
import 'package:flutter_application_1/pages/home/live_location.dart';
import 'package:flutter_application_1/pages/home/location.dart';
import 'package:flutter_application_1/pages/location_detail/location_detail.dart';
import 'package:flutter_application_1/providers_and_state/weather_state.dart';
import 'package:flutter_application_1/services/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController();
    final PageController controller2 = PageController(viewportFraction: 0.7);

    return BlocBuilder<WeatherBloc,WeatherState>(
      builder: (context, state) {
        if(state is WeatherInitial){
          context.read<WeatherBloc>().add(FetchWeatherAndAirQuality());
          return Center(child: CircularProgressIndicator());
        }
        else if(state is WeatherLoading){
          return Center(child: CircularProgressIndicator());
        }
        else if(state is WeatherLoaded){
          final days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

          final List<ForecastItemData> data = List.generate(
            (state.weather.forecast!.length>state.airQuality.aqiDays!.length) ?  state.airQuality.aqiDays!.length:state.weather.forecast!.length ,
            (index) => ForecastItemData(
              aqi: state.airQuality.aqiDays![index].aqi!, 
              day: days[index%7],
              forecast: state.weather.forecast![index],
            ),
          );

          final chunks = List.generate(
            (data.length / 6).ceil(),
            (i) => data.skip(i * 6).take(6).toList(),
          );


          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only( top: 45, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 360,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome Back 👋",
                              style: TextStyle(
                                fontFamily: "ABeeZee",
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text("Anamoul",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: "SF Pro Display",
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF111827),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        elevation: 1,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LiveLocation(
                              aqi: state.airQuality.index!,
                              feelLike: state.weather.feelsLike ?? 0.0,
                              title: state.weather.name!,
                              subtitle: state.weather.country!,
                              temp: state.weather.temp!,
                              text: state.weather.description!,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 211,
                                child: Column(  
                                  spacing: 8,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Forecast",
                                      style: TextStyle(
                                        fontFamily: "SF Pro Display",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Expanded(
                                      child: PageView.builder(
                                        controller: controller,
                                        itemCount: chunks.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: chunks[index].map((item)=>
                                              ForecastItem(
                                                day: item.day, 
                                                aqiIcon: Icons.emoji_emotions, 
                                                aqi: item.aqi,
                                                weatherIcon: item.forecast.icon!, 
                                                degree: item.forecast.avgTemp!,),
                                            ).toList()
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: SmoothPageIndicator(
                                          controller: controller, 
                                          count: (data.length/6).ceil(),
                                          effect: ExpandingDotsEffect(   
                                            dotHeight: 6,
                                            dotWidth: 6,
                                            expansionFactor: 3,
                                            spacing: 6,
                                            activeDotColor: Colors.blue,
                                            dotColor: Colors.grey.shade300,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          AddPlace(title: "Work",location: state.weather.name!, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                          AddPlace(title: "Home",location: state.weather.name!, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: PageView(
                          padEnds: false,
                          controller: controller2,
                          children: [
                            Location(street: state.weather.name!, location: state.weather.country!, cardIcon: Icons.save, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                            Location(street: state.weather.name!, location: state.weather.country!, cardIcon: Icons.save, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                            Location(street: state.weather.name!, location: state.weather.country!, cardIcon: Icons.save, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                            Location(street: state.weather.name!, location: state.weather.country!, cardIcon: Icons.save, aqi: state.airQuality.index!, aqiIcon: Icons.emoji_emotions, degree: state.weather.temp!, weatherIcon: state.weather.icon!),
                          ]
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller2, 
                          count: 4,
                          effect: ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            expansionFactor: 3,
                            spacing: 6,
                            activeDotColor: Colors.blue,
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_)=> LocationDetail())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          maximumSize: Size.fromHeight(54)
                        ), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 16,
                              children: [
                                Icon(Icons.info, color: Color(0xFF1882FF),),
                                Text("Detail Air Quality",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "ABeeZee",
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    color: Color(0xF5000000),
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF1882FF)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if(state is WeatherError){
          return Center(child: Text(state.message));
        }
        else{
          return Container();
        }
      },
    );
  }
}

