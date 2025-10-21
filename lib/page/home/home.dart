import 'package:flutter/material.dart';
import 'package:weather_app/api/airquality.dart';
import 'package:weather_app/api/geocoding.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/page/home/forecast_item.dart';
import 'package:weather_app/page/home/location_card_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weather = WeatherApi();
  final _airQuality = AirQualityApi();
  late Future<
    ({
      Map<String, dynamic> weather,
      String street,
      Map<String, dynamic>? airQuality,
    })
  >
  _weatherDataFuture;
  String _weekdayLabel(DateTime d) {
    const map = {
      DateTime.monday: 'MON',
      DateTime.tuesday: 'TUE',
      DateTime.wednesday: 'WED',
      DateTime.thursday: 'THU',
      DateTime.friday: 'FRI',
      DateTime.saturday: 'SAT',
      DateTime.sunday: 'SUN',
    };
    return map[d.weekday] ?? '';
  }

  String _aqiIconFor(int aqi) {
    if (aqi <= 50) return 'assets/images/home/smile_normal.png';
    if (aqi <= 100) return 'assets/images/home/smile_yellow.png';
    if (aqi <= 150) return 'assets/images/home/smile_orange.png';
    return 'assets/images/home/smile_dark.png';
  }

  String _weatherIconFor(Map<String, dynamic>? condition) {
    final text = (condition?['text'] as String? ?? '').toLowerCase();
    if (text.contains('rain') ||
        text.contains('drizzle') ||
        text.contains('shower')) {
      return 'assets/images/home/rain.png';
    }
    if (text.contains('overcast') || text.contains('cloud')) {
      if (text.contains('partly') || text.contains('patchy')) {
        return 'assets/images/home/cloud_sun.png';
      }
      return 'assets/images/home/cloud.png';
    }
    if (text.contains('sunny') || text.contains('clear')) {
      return 'assets/images/home/sun.png';
    }
    return 'assets/images/home/cloud.png';
  }

  final List<String> street = <String>[
    'Edmund Street',
    'Berkley Street',
    'Fifth Avenue',
    'Oxford Street',
  ];

  final List<String> city = <String>[
    'Birmingham',
    'Birmingham',
    'New York',
    'London',
  ];

  final List<String> aqiLocationImg = <String>[
    'assets/images/home/smile_orange.png',
    'assets/images/home/smile_yellow.png',
    'assets/images/home/smile_normal.png',
    'assets/images/home/smile_dark.png',
  ];

  @override
  void initState() {
    super.initState();
    _weatherDataFuture = () async {
      final weather = await _weather.fetchForecastWeather(
        city: 'Da Nang',
        days: '7',
        aqi: 'yes',
        alerts: 'no',
      );

      final loc = weather['location'] as Map<String, dynamic>;
      final lat = (loc['lat'] as num).toDouble();
      final lon = (loc['lon'] as num).toDouble();

      final street = await getStreetFromLatLng(lat, lon);
      Map<String, dynamic>? airQuality;
      try {
        airQuality = await _airQuality.fetchGeo(lat: lat, lon: lon);

        if ((airQuality['status'] as String?) != 'ok') {
          airQuality = null;
        }
      } catch (_) {}

      return (weather: weather, street: street, airQuality: airQuality);
    }();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body:
          FutureBuilder<
            ({
              Map<String, dynamic> weather,
              String street,
              Map<String, dynamic>? airQuality,
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
              final street = rec.street;
              final airQuality = rec.airQuality;

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
              final tempC = (current['temp_c'] as num?)?.toInt();
              final feelsLikeC = (current['feelslike_c'] as num?)?.toInt();
              final conditionText =
                  (current['condition']?['text'] as String?) ?? '';

              final airData = (airQuality?['data'] as Map?)
                  ?.cast<String, dynamic>();
              final int? currentAQI = (airData?['aqi'] as num?)?.round();

              final List<Map<String, dynamic>> forecast7 = forecastDays
                  .take(7)
                  .toList();

              final Map<String, int> aqiByDate = {};
              final pm25Daily =
                  (airData?['forecast']?['daily']?['pm25'] as List?) ?? [];
              for (final item in pm25Daily) {
                final dayStr = item['day']?.toString();
                final avg = (item['avg'] as num?)?.round();
                if (dayStr != null && avg != null) {
                  aqiByDate[dayStr] = avg;
                }
              }

              final List<String> daysUI = [];
              final List<int> tempsUI = [];
              final List<int> aqisUI = [];
              final List<String> aqiImgsUI = [];
              final List<String> weatherImgsUI = [];

              for (final f in forecast7) {
                final dateStr = f['date']?.toString();
                final date = dateStr != null
                    ? DateTime.tryParse(dateStr)
                    : null;

                // day label
                daysUI.add(date != null ? _weekdayLabel(date) : '');

                final dayObj = (f['day'] as Map?) ?? {};
                final tempAvg = (dayObj['avgtemp_c'] as num?)?.round();
                final tempMax = (dayObj['maxtemp_c'] as num?)?.round();
                tempsUI.add(tempAvg ?? tempMax ?? 0);

                final condition = (dayObj['condition'] as Map?)
                    ?.cast<String, dynamic>();
                weatherImgsUI.add(_weatherIconFor(condition));

                int aqiValue =
                    (dateStr != null && aqiByDate.containsKey(dateStr))
                    ? aqiByDate[dateStr]!
                    : ((airQuality?['aqi'] as num?)?.round() ?? 0);

                aqisUI.add(aqiValue);
                aqiImgsUI.add(_aqiIconFor(aqiValue));
              }
              final int aqiNow =
                  ((airQuality?['data']?['aqi']) as num?)?.round() ?? 0;
              final int tempNow = (current['temp_c'] as num?)?.round() ?? 0;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 16),

                      // TITLE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Back 👋',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: Color.fromRGBO(28, 28, 30, 0.72),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cityName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                              height: 1.2,
                              letterSpacing: 0.5,
                              color: Color.fromRGBO(17, 24, 39, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // CURRENT STATE CARD
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              offset: const Offset(0, 4),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            //  Live location
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/home/GPS icon.png',
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      street,
                                      style: const TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 20 / 14,
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      cityName,
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        height: 12 / 10,
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Weather summary
                            Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/home/rain.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Hàng hiển thị 19°C + mũi tên bé
                                        Row(
                                          children: [
                                            Text(
                                              '$tempC',
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                height: 12 / 16,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              '°C',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 1,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.72,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Image.asset(
                                              'assets/images/home/high.png',
                                              width: 4,
                                              height: 6,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        // Hàng hiển thị mô tả mưa + feels like
                                        Row(
                                          children: [
                                            Text(
                                              conditionText,
                                              style: TextStyle(
                                                fontFamily: 'ABeeZee',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                height: 1,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Feels like $feelsLikeC°C',
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10,
                                                height: 0.8,
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
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                // Một cụm biểu thị AQI tổng quan
                                Row(
                                  children: [
                                    Text(
                                      '$currentAQI',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        height: 28 / 24,
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'AQI',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        height: 14 / 10,
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/images/home/smile_normal.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // ===================== FORCAST BLOCK (INLINE) =====================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Forcast',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 14 / 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.72),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                SizedBox(
                                  height: 130,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: daysUI.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 4),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          return Container(
                                            width: 48,
                                            height: 130,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ForecastItem(
                                              day: daysUI[index],
                                              aqiImg: aqiImgsUI[index],
                                              aqi: aqisUI[index],
                                              weatherImg: weatherImgsUI[index],
                                              temp: tempsUI[index],
                                            ),
                                          );
                                        },
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Dot indicator
                                Row(
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
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ADD PLACE
                      Row(
                        children: [
                          // Location data card
                          Container(
                            width: 163.5,
                            height: 86,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Work',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    height: 1.6,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                                const Text(
                                  'Coventry ST, Birmingham',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 8,
                                    height: 1.0,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.72),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    // AQI
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/home/smile_normal.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Row(
                                          children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                height: 1.25,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'AQI'.toUpperCase(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 1.0,
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
                                      ],
                                    ),

                                    const Spacer(),

                                    // Weather
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/home/rain.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              '25',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                height: 1.25,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '°C'.toUpperCase(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 2.0,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          // Location data card
                          Container(
                            width: 163.5,
                            height: 86,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    height: 1.6,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                                const Text(
                                  'Coventry ST, Birmingham',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 8,
                                    height: 1.0,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.72),
                                  ),
                                ),
                                const SizedBox(height: 8), // chính là gap: 8px
                                Row(
                                  children: [
                                    // AQI
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/home/smile_normal.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Row(
                                          children: [
                                            Text(
                                              '2',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                height: 1.25,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'AQI'.toUpperCase(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 1.0,
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
                                      ],
                                    ),

                                    const Spacer(),

                                    // Weather
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/home/rain.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              '22',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                height: 1.25,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '°C'.toUpperCase(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 2.0,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ===================== LOCATIONS =====================
                      Column(
                        children: [
                          SizedBox(
                            height: 88,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                return LocationItem(
                                  street: street,
                                  city: cityName,
                                  aqi: aqiNow,
                                  tempC: tempNow,
                                  conditionText: conditionText,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Dot indicator (ẩn/hiện tùy bạn)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 6,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(24, 130, 255, 1),
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
                                  color: const Color.fromRGBO(209, 213, 219, 1),
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
                                  color: const Color.fromRGBO(209, 213, 219, 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // DETAIL AIR QUALITY
                      Container(
                        width: 336,
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.06),
                              offset: const Offset(0, 4),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/home/Trailing Icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Detail Air Quality',
                                    style: const TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 24 / 16,
                                      letterSpacing: 0.15,
                                      color: Color.fromRGBO(0, 0, 0, 0.96),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/images/home/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
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
