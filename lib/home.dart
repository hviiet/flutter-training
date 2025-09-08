import 'package:flutter/material.dart';

/// Màn hình chính: chứa tiêu đề, thẻ “Current state” và khối Forcast có slider
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Dữ liệu mẫu cho phần forcast
  final List<String> days = <String>[
    'MON',
    'TUE',
    'WEN',
    'THU',
    'FRI',
    'SAT',
    'SUN',
  ];

  final List<String> aqiImg = <String>[
    'assets/images/home/smile_normal.png',
    'assets/images/home/smile_light.png',
    'assets/images/home/smile_dark.png',
    'assets/images/home/smile_normal.png',
    'assets/images/home/smile_light.png',
    'assets/images/home/smile_dark.png',
    'assets/images/home/smile_dark.png',
  ];

  final List<int> aqi = <int>[1, 2, 2, 1, 3, 1, 2];

  final List<String> weatherImg = <String>[
    'assets/images/home/rain.png',
    'assets/images/home/cloud.png',
    'assets/images/home/cloud_sun.png',
    'assets/images/home/sun.png',
    'assets/images/home/cloud.png',
    'assets/images/home/cloud_sun.png',
    'assets/images/home/sun.png',
  ];

  final List<int> temp = <int>[20, 21, 22, 17, 23, 21, 19];

  // Dữ liệu mẫu cho phần Location
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
                          'assets/images/home/GPS icon.png',
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
                              'assets/images/home/rain.png',
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
                                      'assets/images/home/high.png',
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
                            itemCount: days.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 4),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 48,
                                height: 130,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Day label
                                    Text(
                                      days[index],
                                      style: TextStyle(
                                        fontFamily: 'ABeeZee',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        height: 1.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.72),
                                      ),
                                    ),

                                    // AQI block
                                    Column(
                                      children: [
                                        Image.asset(
                                          aqiImg[index],
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${aqi[index]}',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.0,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              'AQI',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 1.0,
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

                                    // Divider
                                    const SizedBox(
                                      width: 32,
                                      child: Divider(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        thickness: 1,
                                        height: 1,
                                      ),
                                    ),

                                    // Temp block
                                    Column(
                                      children: [
                                        Image.asset(
                                          weatherImg[index],
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${temp[index]}',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.0,
                                                letterSpacing: -0.5,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.96,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              '°C',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8,
                                                height: 1.0,
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
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(24, 130, 255, 1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(209, 213, 219, 1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(209, 213, 219, 1),
                                borderRadius: BorderRadius.circular(100),
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

              // ===================== LOCATIONS =====================
              Column(
                children: [
                  SizedBox(
                    height: 88,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: city.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 240,
                          height: 88,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Locate
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          street[index],
                                          style: TextStyle(
                                            fontFamily: 'ABeeZee',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 16 / 12,
                                            color: Color.fromRGBO(
                                              0,
                                              0,
                                              0,
                                              0.96,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          city[index],
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 8,
                                            height: 10 / 8,
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
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/images/home/decorate_icon.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),

                              // AQI + Temp
                              Row(
                                children: [
                                  // AQI block
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        aqiLocationImg[index],
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '${aqi[index]}',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          height: 1.0,
                                          letterSpacing: -0.5,
                                          color: Color.fromRGBO(0, 0, 0, 0.96),
                                        ),
                                      ),
                                      const SizedBox(width: 2),
                                      const Text(
                                        'AQI',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 8,
                                          height: 1.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.72),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  // Temp block
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${temp[index]}',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          height: 1.0,
                                          letterSpacing: -0.5,
                                          color: Color.fromRGBO(0, 0, 0, 0.96),
                                        ),
                                      ),
                                      const SizedBox(width: 2),
                                      const Text(
                                        '°C',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 8,
                                          height: 1.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.72),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Image.asset(
                                        'assets/images/home/cold_icon.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Dot indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(24, 130, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(209, 213, 219, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
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
      ),
    );
  }
}
