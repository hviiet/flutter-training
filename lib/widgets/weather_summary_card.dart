import 'package:flutter/material.dart';

import '../models/forecast.dart';
import '../models/weather_status.dart';
import '../models/weather_location.dart';
import '../widgets/aqi_status_icon.dart';
import '../widgets/forecast_item_card.dart';

class WeatherSummaryCard extends StatefulWidget {
  final WeatherLocation location;
  final List<Forecast> forecasts;

  const WeatherSummaryCard({
    super.key, 
    required this.location, 
    required this.forecasts
  });


  @override
  State<WeatherSummaryCard> createState() => _WeatherSummaryCardState();
}

class _WeatherSummaryCardState extends State<WeatherSummaryCard> {
  int _currentForecastPage = 0;
  final PageController _forecastPageController = PageController(viewportFraction: 0.22);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
      margin: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),

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
          Row(
            children: [
              Icon(
                Icons.my_location_outlined,
                size: 30.0,
                color: const Color.fromARGB(255, 28, 115, 255),
              ),

              const SizedBox(width: 12.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.location.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(17, 24, 39, 1.0),
                    ),
                  ),

                  Text(
                    widget.location.city,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(90, 90, 90, 1.0),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8.0),

          Row(
            children: [
              Icon(
                widget.location.weatherStatus.getIcon,
                color: widget.location.weatherStatus.getColor,
                size: 30.0,
              ),

              const SizedBox(width: 12.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${widget.location.temperature}°C',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(17, 24, 39, 1.0),
                        ),
                      ),

                      const Icon(
                        Icons.arrow_upward,
                        size: 14.0,
                        color: Color.fromRGBO(54, 232, 47, 1),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        widget.location.weatherStatus.getLabel,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(90, 90, 90, 1.0),
                        ),
                      ),

                      const SizedBox(width: 4.0),

                      Text(
                        'Feels like ${widget.location.feelsLike}°C',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(90, 90, 90, 1.0),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),

              const Spacer(),

              Text(
                '${widget.location.aqi}',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

              const SizedBox(width: 2.0),

              Text(
                'AQI',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(90, 90, 90, 1.0),
                ),
              ),

              const SizedBox(width: 6.0),

              AqiStatusIcon(aqi: widget.location.aqi, size: 24.0),
            ],
          ),


          const SizedBox(height: 10.0),

          const Text(
            'Forecast',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(70, 70, 70, 1),
            ),
          ),

          const SizedBox(height: 6.0),

          SizedBox(
            height: 160.0,
            child: PageView.builder(
              controller: _forecastPageController,
              itemCount: widget.forecasts.length,
              padEnds: false,
              onPageChanged: (index) {
                setState(() {
                  _currentForecastPage = index ~/ 3;
                });
              },
              itemBuilder: (context, index) => ForecastItemCard(forecast: widget.forecasts[index]),
            ),
          ),

          const SizedBox(height: 14.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate((widget.forecasts.length / 4).ceil(), (index) { 
              bool isActive = index == _currentForecastPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: isActive ? 24.0 : 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: isActive ? const Color.fromRGBO(28, 115, 255, 1) : const Color.fromRGBO(200, 200, 200, 1),
                  borderRadius: BorderRadius.circular(3.0),
                ),
              );
            }),

          )

        ],
      ),
    );
  }
}