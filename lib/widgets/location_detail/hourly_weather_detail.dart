import 'package:flutter/material.dart';
import 'package:flutter_training/models/location_detail_data.dart';
import 'package:flutter_training/models/weather_location.dart';

class HourlyWeatherDetail extends StatefulWidget {
  final WeatherLocation currentLocation;
  final List<HourlyWeatherForecastItem> hourlyForecasts;

  const HourlyWeatherDetail({
    super.key,
    required this.currentLocation,
    required this.hourlyForecasts,
  });

  @override
  State<HourlyWeatherDetail> createState() => _HourlyWeatherDetailState();
}

class _HourlyWeatherDetailState extends State<HourlyWeatherDetail> {
  final PageController pageController = PageController(viewportFraction: 0.22);
  int currentHourIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      //margin: const EdgeInsets.all(6.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const[
          BoxShadow(
            color:  Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 12.0,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 5.0),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Now',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(90, 90, 90, 1.0),
                    ),
                  ),

                  Text(
                    widget.currentLocation.conditionText,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(225, 0, 0, 0),
                    ),
                  ),

                  Text(
                    'Feels like ${widget.currentLocation.feelsLike}°C',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromRGBO(90, 90, 90, 1.0),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Image.network(
                widget.currentLocation.conditionIcon,
                width: 30.0,
                height: 30.0,
              ),

              const SizedBox(width: 12.0),

              Text(
                '${widget.currentLocation.temp.toStringAsFixed(1).replaceAll('.0', '')}°C',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

            ],
          ),

          const SizedBox(height: 14.0),

          SizedBox(
            height: 100.0,
            child: PageView.builder(
              itemCount: widget.hourlyForecasts.length,
              controller: pageController,
              padEnds: false,
              onPageChanged: (index) {
                setState(() {
                  currentHourIndex = index ~/ 4;
                });
              },
              itemBuilder: (context, index) {
                final forecast = widget.hourlyForecasts[index];
                return Column(
                  children: [
                    buildHourlyForecastItem(forecast),
                  ],
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (widget.hourlyForecasts.length / 5).ceil(),
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: currentHourIndex == index ? 24.0 : 6.0,
                height: 6.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: currentHourIndex == index
                      ? const Color.fromRGBO(71, 130, 255, 1)
                      : const Color.fromARGB(255, 217, 214, 214),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget buildHourlyForecastItem(HourlyWeatherForecastItem forecast) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
      width: 65.0,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          Image.network(
            forecast.conditionIcon,
            width: 30.0,
            height: 30.0,
          ),

          const SizedBox(height: 4.0),

          Text(
            '${forecast.temp.toStringAsFixed(1).replaceAll('.0', '')}°C',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(17, 24, 39, 1.0),
            ),
          ),

          Text(
            forecast.time,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color.fromRGBO(90, 90, 90, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}

