import 'package:flutter/material.dart';
import 'package:weather_app/api/air_quality.dart';
import 'package:weather_app/api/geo_coding.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/page/aqi_scale/aqi_scale.dart';
import 'package:weather_app/page/location_details/air_quality_card.dart';
import 'package:weather_app/page/location_details/chart.dart';
import 'package:weather_app/page/location_details/health_data_card.dart';
import 'package:weather_app/page/location_details/weather_card.dart';
import 'package:weather_app/page/location_details/weather_forcast_card.dart';

class LocationDetails extends StatefulWidget {
  final String city;
  const LocationDetails({super.key, required this.city});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final _api = WeatherApi();
  final _aqApi = AirQualityApi();
  late Future<
    ({Map<String, dynamic> weather, String street, Map<String, dynamic>? waqi})
  >
  _weatherDataFuture;

  final List<String> iconSmilePaths = [
    'assets/images/home/smile_light.png',
    'assets/images/home/smile_dark.png',
    'assets/images/home/smile_normal.png',
    'assets/images/home/smile_orange.png',
    'assets/images/home/smile_yellow.png',
  ];
  final List<String> titles = [
    'Current Temperature',
    'Rain Forecast',
    'Air Quality',
    'Wind Speed',
    'Humidity',
  ];
  final List<String> subtitles = [
    'Today\'s temperature ranges from 25°C to 32°C, with light sunshine, perfect for outdoor activities.',
    'There\'s a 70% chance of showers this afternoon, so don\'t forget to bring an umbrella!',
    'The current AQI is 75, indicating moderate air quality; limit prolonged outdoor exposure.',
    'Winds are blowing gently at 10 km/h from the Northeast, creating a pleasant atmosphere.',
    'Humidity is at 65%, making it slightly muggy; stay hydrated and don\'t leave clothes out to dry too long.',
  ];

  @override
  void initState() {
    super.initState();
    _weatherDataFuture = () async {
      final weather = await _api.fetchForecastWeather(
        city: widget.city,
        days: '7',
        aqi: 'yes',
        alerts: 'no',
      );

      final loc = weather['location'] as Map<String, dynamic>;
      final lat = (loc['lat'] as num).toDouble();
      final lon = (loc['lon'] as num).toDouble();

      final street = await getStreetFromLatLng(lat, lon);
      Map<String, dynamic>? waqi;
      try {
        waqi = await _aqApi.fetchGeo(lat: lat, lon: lon);
      } catch (_) {}

      return (weather: weather, street: street, waqi: waqi);
    }();
  }

  int _to10FromUS(int us1to6) {
    final u = us1to6.clamp(1, 6);
    return ((u - 1) * 9 / 5).round() + 1;
  }

  ({int R, int G, int B}) _colorForLevel10(int lvl) {
    switch (lvl.clamp(1, 10)) {
      case 1:
        return (R: 2, G: 250, B: 131);
      case 2:
        return (R: 2, G: 219, B: 92);
      case 3:
        return (R: 48, G: 181, B: 2);
      case 4:
        return (R: 255, G: 222, B: 48);
      case 5:
        return (R: 254, G: 177, B: 86);
      case 6:
        return (R: 236, G: 139, B: 26);
      case 7:
        return (R: 255, G: 108, B: 62);
      case 8:
        return (R: 255, G: 0, B: 0);
      case 9:
        return (R: 216, G: 0, B: 0);
      case 10:
        return (R: 206, G: 3, B: 149);
      default:
        return (R: 0, G: 0, B: 0);
    }
  }

  String _iconForLevel10(int lvl) {
    final n = lvl.clamp(1, 10);
    return (n <= 4)
        ? 'assets/images/locationdetails/happy.png'
        : 'assets/images/locationdetails/unhappy.png';
  }

  String _labelForLevel10(int lvl) {
    final n = lvl.clamp(1, 10);
    if (n <= 2) return 'Good';
    if (n <= 4) return 'Fair';
    if (n <= 6) return 'Moderate';
    if (n <= 8) return 'Poor';
    return 'Very Poor';
  }

  String _conditionToAsset(String text, {required bool isDay}) {
    final t = text.toLowerCase();
    if (t.contains('thunder') || t.contains('storm')) {
      return 'assets/images/locationdetails/lighting.png';
    } else if (t.contains('drizzle') || t.contains('rain')) {
      return 'assets/images/locationdetails/rain_more.png';
    } else if (t.contains('cloud')) {
      return isDay
          ? 'assets/images/locationdetails/cloud_sun.png'
          : 'assets/images/locationdetails/cloud_more.png';
    } else if (t.contains('sunny') || t.contains('clear')) {
      return 'assets/images/locationdetails/sun.png';
    } else if (t.contains('wind')) {
      return 'assets/images/locationdetails/wind.png';
    }
    return 'assets/images/locationdetails/cloud_more.png';
  }

  List<({String time, int temp, String iconAsset})> _next24Hours(
    Map<String, dynamic> weather,
  ) {
    final List hours = (weather['forecast']['forecastday'][0]['hour'] as List);
    final take = hours.take(24).toList();

    return take.map<({String time, int temp, String iconAsset})>((h) {
      final m = h as Map<String, dynamic>;
      final time = (m['time'] as String).split(' ').last;
      final temp = (m['temp_c'] as num).round();
      final cond = (m['condition']?['text'] as String?) ?? '';
      final isDay = (m['is_day'] as num?) == 1;
      final iconAsset = _conditionToAsset(cond, isDay: isDay);
      return (time: time, temp: temp, iconAsset: iconAsset);
    }).toList();
  }

  List<int> _level10_7Days(Map<String, dynamic> weather) {
    final List days =
        (weather['forecast']?['forecastday'] as List?) ?? const [];
    return days.map<int>((d) {
      final day = Map<String, dynamic>.from(d as Map);
      final dayInfo = Map<String, dynamic>.from((day['day'] ?? {}) as Map);
      final aq = Map<String, dynamic>.from(
        (dayInfo['air_quality'] ?? {}) as Map,
      );

      final gb = (aq['gb-defra-index'] as num?)?.toInt();
      final us = (aq['us-epa-index'] as num?)?.toInt();
      if (gb != null) return gb.clamp(1, 10);
      if (us != null) return _to10FromUS(us);
      return 5;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          padding: const EdgeInsets.all(8),
          icon: Image.asset(
            "assets/images/aqiscale/Arrow-Left.png",
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Current Location',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.5,
                letterSpacing: 0.5,
                color: Color.fromRGBO(17, 24, 39, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/locationdetails/gps.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),

      body:
          FutureBuilder<
            ({
              Map<String, dynamic> weather,
              String street,
              Map<String, dynamic>? waqi,
            })
          >(
            future: _weatherDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }

              final rec = snapshot.data!;
              final weather = rec.weather;
              final waqi = rec.waqi;
              final street = rec.street;
              final recItems = makeRecs(weather, waqi: waqi);

              final location = Map<String, dynamic>.from(
                weather['location'] as Map,
              );
              final current = Map<String, dynamic>.from(
                weather['current'] as Map,
              );
              final forecastDays =
                  (weather['forecast']?['forecastday'] as List? ?? [])
                      .map<Map<String, dynamic>>(
                        (e) => Map<String, dynamic>.from(e as Map),
                      )
                      .toList();

              final cityName = location['name'] as String? ?? '';
              final region = location['region'] as String? ?? '';
              final tempC = (current['temp_c'] as num?)?.toInt();
              final feelsLikeC = (current['feelslike_c'] as num?)?.toInt();
              final conditionText =
                  (current['condition']?['text'] as String?) ?? '';
              final isDayNow = (current['is_day'] as num?) == 1;

              // Air quality hiện tại (thang 1..10)
              final aq = (current['air_quality'] ?? {}) as Map<String, dynamic>;
              final usIdx = (aq['us-epa-index'] as num?)?.toInt();
              final gbIdx = (aq['gb-defra-index'] as num?)?.toInt();
              final level10 = gbIdx ?? (usIdx != null ? _to10FromUS(usIdx) : 5);
              final levelRGB = _colorForLevel10(level10);
              final levelTint = Color.fromRGBO(
                levelRGB.R,
                levelRGB.G,
                levelRGB.B,
                1,
              );
              final levelIcon = _iconForLevel10(level10);
              final levelLabel = _labelForLevel10(level10);

              final co = (aq['co'] as num?)?.toDouble();
              final no2 = (aq['no2'] as num?)?.toDouble();
              final o3 = (aq['o3'] as num?)?.toDouble();
              final so2 = (aq['so2'] as num?)?.toDouble();
              final pm25 = (aq['pm2_5'] as num?)?.toDouble();
              final pm10 = (aq['pm10'] as num?)?.toDouble();

              // 24 giờ tiếp theo
              final hours24 = _next24Hours(weather);

              // 7 ngày (1..10)
              final lvl7 = _level10_7Days(weather);
              final weekdayLabels = [
                'SAT',
                'SUN',
                'MON',
                'TUE',
                'WED',
                'THU',
                'FRI',
              ];

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: Column(
                    children: [
                      // Frame 1
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            // Location title
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    street.isNotEmpty ? street : cityName,
                                    style: const TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.5,
                                      letterSpacing: 0.5,
                                      color: Color.fromRGBO(0, 0, 0, 0.96),
                                    ),
                                  ),
                                  Text(
                                    cityName.isNotEmpty ? cityName : region,
                                    style: const TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.35,
                                      letterSpacing: 0.5,
                                      color: Color.fromRGBO(0, 0, 0, 0.72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Air Quality
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  // title
                                  Row(
                                    children: [
                                      const Text(
                                        'Air Quality',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          height: 1.0,
                                          letterSpacing: 0,
                                          color: Color.fromRGBO(0, 0, 0, 0.96),
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/images/home/Trailing Icon.png',
                                          height: 24,
                                          width: 24,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => AQIScale(
                                                city: cityName,
                                                street: street,
                                                temp: tempC ?? 0,
                                                aqi: level10,
                                                conditionText: conditionText,
                                                feelsLikeC: feelsLikeC ?? 0,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // info
                                  SizedBox(
                                    height: 88,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/locationdetails/Circular-half.png',
                                          height: 88,
                                        ),
                                        Align(
                                          alignment: const Alignment(0, 1),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '$level10',
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 24,
                                                      height: 1.0,
                                                      letterSpacing: 0.5,
                                                      color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.96,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Text(
                                                    'AQI',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10,
                                                      height: 1.4,
                                                      letterSpacing: 0,
                                                      color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.72,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    levelIcon,
                                                    height: 24,
                                                    width: 24,
                                                    color: levelTint,
                                                    colorBlendMode:
                                                        BlendMode.srcIn,
                                                  ),

                                                  const SizedBox(width: 4),
                                                  Text(
                                                    levelLabel,
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      height: 20 / 14,
                                                      letterSpacing: 0.25,
                                                      color: levelTint,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // row 1
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'O3',
                                            value: o3 ?? 0,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'PM10',
                                            value: pm10 ?? 0,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'NO2',
                                            value: no2 ?? 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // row 2
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'PM2.5',
                                            value: pm25 ?? 0,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'SO2',
                                            value: so2 ?? 0,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: AirQualityCard(
                                            unit: 'CO',
                                            value: co ?? 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Weather Current state card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 16,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Weather',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Now'.toUpperCase(),
                                              style: const TextStyle(
                                                fontFamily: 'ABeeZee',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                height: 1.0,
                                                letterSpacing: 1.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.72,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              conditionText,
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                height: 20 / 16,
                                                letterSpacing: 0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              feelsLikeC != null
                                                  ? 'Feels like ${feelsLikeC.toStringAsFixed(0)}°C'
                                                  : '',
                                              style: const TextStyle(
                                                fontFamily: 'ABeeZee',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                height: 1.4,
                                                letterSpacing: 0,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.72,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  tempC != null
                                                      ? tempC.toStringAsFixed(0)
                                                      : '-',
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                    height: 1.2,
                                                    letterSpacing: 0.5,
                                                    color: Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      0.96,
                                                    ),
                                                  ),
                                                ),
                                                const Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '°C',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontFamily: 'ABeeZee',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
                                                      height: 1.4,
                                                      letterSpacing: 0,
                                                      color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.72,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Image.asset(
                                              _conditionToAsset(
                                                conditionText,
                                                isDay: isDayNow,
                                              ),
                                              fit: BoxFit.cover,
                                              height: 48,
                                              width: 48,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // 12 hours horizontal
                                  SizedBox(
                                    height: 96,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      itemCount: hours24.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(width: 4),
                                      itemBuilder: (context, index) {
                                        final h = hours24[index];
                                        return WeatherCard(
                                          iconPath: h.iconAsset,
                                          temperature: h.temp,
                                          time: h.time,
                                        );
                                      },
                                    ),
                                  ),

                                  // Dot indicator
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 6,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              24,
                                              130,
                                              255,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 6,
                                          height: 6,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              209,
                                              213,
                                              219,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 6,
                                          height: 6,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              209,
                                              213,
                                              219,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 6,
                                          height: 6,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              209,
                                              213,
                                              219,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // AQ Forecast
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    // Title
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'AQ Forecast',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                height: 1.0,
                                                letterSpacing: 0.0,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Next 7 days',
                                              style: TextStyle(
                                                fontFamily: 'ABeeZee',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                height: 1.4,
                                                letterSpacing: 0.0,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.72,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 4,
                                            bottom: 4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'AQI',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  height: 1.5,
                                                  letterSpacing: 0.32,
                                                  color: Color.fromRGBO(
                                                    24,
                                                    130,
                                                    255,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Image.asset(
                                                'assets/images/locationdetails/arrow-down.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    // Graph
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        height: 134,
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                              top: 16,
                                            ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 112,
                                              child: Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  Column(
                                                    children: const [
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.08,
                                                        ),
                                                        height: 0,
                                                      ),
                                                      SizedBox(height: 28),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.08,
                                                        ),
                                                        height: 0,
                                                      ),
                                                      SizedBox(height: 28),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.08,
                                                        ),
                                                        height: 0,
                                                      ),
                                                      SizedBox(height: 28),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.08,
                                                        ),
                                                        height: 0,
                                                      ),
                                                      SizedBox(height: 28),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.08,
                                                        ),
                                                        height: 0,
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        for (
                                                          int i = 0;
                                                          i <
                                                              (lvl7.length >= 7
                                                                  ? 7
                                                                  : lvl7.length);
                                                          i++
                                                        ) ...[
                                                          Builder(
                                                            builder: (context) {
                                                              final idx =
                                                                  lvl7[i].clamp(
                                                                    1,
                                                                    10,
                                                                  );
                                                              final c =
                                                                  _colorForLevel10(
                                                                    idx,
                                                                  );
                                                              return Chart(
                                                                R: c.R,
                                                                G: c.G,
                                                                B: c.B,
                                                                value: idx,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                for (int i = 0; i < 7; i++)
                                                  Text(
                                                    weekdayLabels[i],
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      height: 14 / 10,
                                                      letterSpacing: 0.0,
                                                      color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.4,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Weather Forecast
                            Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Weather Forecast',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          height: 1.0,
                                          letterSpacing: 0.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.96),
                                        ),
                                      ),
                                      Text(
                                        'Next 7 days',
                                        style: TextStyle(
                                          fontFamily: 'ABeeZee',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          height: 1.4,
                                          letterSpacing: 0.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.72),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Weather forcast data
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Column(
                                      children: [
                                        for (
                                          int i = 0;
                                          i < forecastDays.length;
                                          i++
                                        ) ...[
                                          Builder(
                                            builder: (context) {
                                              final d = forecastDays[i];
                                              final dateStr =
                                                  (d['date'] as String?) ?? '';
                                              final dayInfo =
                                                  d['day']
                                                      as Map<String, dynamic>;
                                              final high =
                                                  (dayInfo['maxtemp_c'] as num?)
                                                      ?.round() ??
                                                  0;
                                              final low =
                                                  (dayInfo['mintemp_c'] as num?)
                                                      ?.round() ??
                                                  0;
                                              final cond =
                                                  (dayInfo['condition']?['text']
                                                      as String?) ??
                                                  '';
                                              final iconAsset =
                                                  _conditionToAsset(
                                                    cond,
                                                    isDay: true,
                                                  );
                                              final label = i == 0
                                                  ? 'today'
                                                  : (i == 1 ? 'tomorrow' : '');
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 4.0,
                                                ),
                                                child: WeatherForcastCard(
                                                  day: dateStr,
                                                  todayOrTomorrow: label,
                                                  high: high,
                                                  low: low,
                                                  iconPath: iconAsset,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Fram 2
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Recommendations',
                              style: TextStyle(
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                height: 22 / 14,
                                letterSpacing: 0.5,
                                color: Color.fromRGBO(0, 0, 0, 0.72),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 87,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 8),
                                itemCount: recItems.length,
                                itemBuilder: (context, index) => HealthDataCard(
                                  iconPath: recItems[index].icon,
                                  title: recItems[index].title,
                                  subtitle: recItems[index].subtitle,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),
                            // Dot indicator
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        24,
                                        130,
                                        255,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        209,
                                        213,
                                        219,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        209,
                                        213,
                                        219,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: 6,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        209,
                                        213,
                                        219,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}

class RecItem {
  final String icon, title, subtitle;
  RecItem(this.icon, this.title, this.subtitle);
}

int _us6to10(int us) => ((us.clamp(1, 6) - 1) * 9 / 5).round() + 1;

List<RecItem> makeRecs(
  Map<String, dynamic> weather, {
  Map<String, dynamic>? waqi,
}) {
  final current = Map<String, dynamic>.from(weather['current'] as Map);
  final today = Map<String, dynamic>.from(
    (weather['forecast']['forecastday'] as List).first as Map,
  );
  final day = Map<String, dynamic>.from(today['day'] as Map);

  final temp = (current['temp_c'] as num?)?.round() ?? 0;
  final wind = (current['wind_kph'] as num?)?.round() ?? 0;
  final humidity = (current['humidity'] as num?)?.round() ?? 0;
  final chanceRain = (day['daily_chance_of_rain'] as num?)?.round() ?? 0;

  int? aqiRaw;
  int? level10;
  if (waqi != null && waqi['status'] == 'ok') {
    aqiRaw = (waqi['data']?['aqi'] as num?)?.toInt();
    if (aqiRaw != null) level10 = (aqiRaw / 10).clamp(1, 10).round();
  }
  if (level10 == null) {
    final aq = (current['air_quality'] as Map?)?.cast<String, dynamic>();
    final gb = (aq?['gb-defra-index'] as num?)?.toInt();
    final us = (aq?['us-epa-index'] as num?)?.toInt();
    level10 = gb ?? (us != null ? _us6to10(us) : null);
    aqiRaw ??= (aq?['pm2_5'] as num?)?.round();
  }

  String rainMsg = chanceRain >= 60
      ? 'High chance of rain — take an umbrella.'
      : chanceRain >= 20
      ? 'Some chance of showers.'
      : 'Little to no rain expected.';

  String windMsg = wind >= 30
      ? 'Gusty — secure loose items.'
      : wind >= 15
      ? 'Breezy conditions.'
      : 'Light winds.';

  String humMsg = humidity >= 70
      ? 'Muggy — stay hydrated.'
      : humidity <= 35
      ? 'Dry — consider moisturizer.'
      : 'Comfortable humidity.';

  String aqMsg;
  if (level10 == null) {
    aqMsg = 'Air quality info unavailable.';
  } else if (level10 <= 4) {
    aqMsg =
        '${aqiRaw != null ? 'AQI $aqiRaw. ' : ''}Good for outdoor activities.';
  } else if (level10 <= 6) {
    aqMsg =
        '${aqiRaw != null ? 'AQI $aqiRaw. ' : ''}Moderate — sensitive groups limit long exposure.';
  } else if (level10 <= 8) {
    aqMsg =
        '${aqiRaw != null ? 'AQI $aqiRaw. ' : ''}Poor — consider a mask outdoors.';
  } else {
    aqMsg =
        '${aqiRaw != null ? 'AQI $aqiRaw. ' : ''}Very poor — avoid outdoor exercise.';
  }

  return [
    RecItem(
      'assets/images/home/smile_light.png',
      'Current Temperature',
      'Now $temp°C. Dress accordingly.',
    ),
    RecItem('assets/images/home/smile_dark.png', 'Rain Forecast', rainMsg),
    RecItem('assets/images/home/smile_normal.png', 'Air Quality', aqMsg),
    RecItem(
      'assets/images/home/smile_orange.png',
      'Wind Speed',
      '$wind km/h. $windMsg',
    ),
    RecItem(
      'assets/images/home/smile_yellow.png',
      'Humidity',
      '$humidity%. $humMsg',
    ),
  ];
}
