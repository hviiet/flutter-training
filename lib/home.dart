import 'package:flutter/material.dart';
import 'components/places_carousel.dart';
import 'components/forecast_block.dart';

/// Màn hình chính: chứa tiêu đề, thẻ “Current state” và khối Forcast có slider
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ----------------- DATA MẪU DÙNG ĐỂ TEST SLIDER -----------------
  final List<Forecast> _forecasts = const [
    Forecast(day: 'MON', aqi: 3, temp: 19),
    Forecast(day: 'TUE', aqi: 5, temp: 21),
    Forecast(day: 'WED', aqi: 2, temp: 22),
    Forecast(day: 'THU', aqi: 4, temp: 18),
    Forecast(day: 'FRI', aqi: 1, temp: 20),
    Forecast(day: 'SAT', aqi: 6, temp: 23),
    Forecast(day: 'SUN', aqi: 2, temp: 17),
    Forecast(day: 'MON', aqi: 3, temp: 24),
    Forecast(day: 'TUE', aqi: 4, temp: 19),
    Forecast(day: 'WED', aqi: 1, temp: 20),
    Forecast(day: 'THU', aqi: 3, temp: 22),
    Forecast(day: 'FRI', aqi: 5, temp: 26),
  ];

  final demoPlaces = <PlaceCardData>[
    PlaceCardData('Edmund Street', 'Birmingham', 5, 21),
    PlaceCardData('Berkley Street', 'Birmingham', 4, 21),
    PlaceCardData('Colmore Row', 'Birmingham', 3, 20),
    PlaceCardData('Victoria Sq.', 'Birmingham', 2, 22),
    PlaceCardData('Snow Hill', 'Birmingham', 6, 19),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ListView(
            children: [
              const SizedBox(height: 16),

              // TITLE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // căn trái
                children: const [
                  Text(
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
                  SizedBox(height: 4),
                  Text(
                    'Anamoul',
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
                          'assets/images/GPS icon.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Church Street Square',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: Color.fromRGBO(0, 0, 0, 0.96),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Birmingham',
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
                              'assets/images/weather-icons.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hàng hiển thị 19°C + mũi tên bé
                                Row(
                                  children: [
                                    const Text(
                                      '19',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 12 / 16,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
                                      ),
                                    ),
                                    const Text(
                                      '°C',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 8,
                                        height: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/images/high.png',
                                      width: 4,
                                      height: 6,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // Hàng hiển thị mô tả mưa + feels like
                                Row(
                                  children: const [
                                    Text(
                                      'Rain Shower · ',
                                      style: TextStyle(
                                        fontFamily: 'ABeeZee',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        height: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
                                      ),
                                    ),
                                    Text(
                                      'Feels like 11°C',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                        height: 0.8,
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
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
                            const Text(
                              '3',
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
                              'assets/images/icon.png',
                              width: 32,
                              height: 32,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ===================== FORCAST BLOCK =====================
                    ForecastCarouselWithDots(forecasts: _forecasts),
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
                                  'assets/images/icon.png',
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
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
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
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
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
                                  'assets/images/weather-icons.png',
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
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
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
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
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
                                  'assets/images/icon.png',
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
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
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
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
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
                                  'assets/images/weather-icons.png',
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
                                        color: Color.fromRGBO(0, 0, 0, 0.96),
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
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
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

              // LOCATIONS
              PlacesCarouselWithIndicator(cards: demoPlaces),

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
                            'assets/images/Trailing Icon.png',
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
                        'assets/images/right_arrow.png',
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
      ),

      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(17, 24, 39, 0.1),
              offset: const Offset(0, -10),
              blurRadius: 25,
              spreadRadius: -25,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/home.png', width: 24, height: 24),
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 12 / 10,
                    letterSpacing: -0.5,
                    color: Color.fromRGBO(36, 93, 216, 1),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/databank.png',
                  width: 24,
                  height: 24,
                ),
                Text(
                  'Data Bank',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 12 / 10,
                    letterSpacing: -0.5,
                    color: Color.fromRGBO(0, 0, 0, 0.72),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/more.png', width: 24, height: 24),
                Text(
                  'More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 12 / 10,
                    letterSpacing: -0.5,
                    color: Color.fromRGBO(0, 0, 0, 0.72),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
