import 'package:flutter/material.dart';

final List<Map<String, dynamic>> forecastData = [
  {'day': 'MON', 'aqi': 1, 'temp': 20, 'icon': Icons.cloud_outlined},
  {'day': 'TUE', 'aqi': 2, 'temp': 21, 'icon': Icons.cloud_queue_outlined},
  {'day': 'WEN', 'aqi': 3, 'temp': 22, 'icon': Icons.cloudy_snowing},
  {'day': 'THU', 'aqi': 2, 'temp': 21, 'icon': Icons.wb_sunny_outlined},
  {'day': 'FRI', 'aqi': 1, 'temp': 20, 'icon': Icons.cloud_outlined},
  {'day': 'SAT', 'aqi': 2, 'temp': 20, 'icon': Icons.wb_sunny_outlined},
  {'day': 'SUN', 'aqi': 3, 'temp': 23, 'icon': Icons.cloudy_snowing},
];

final List<Map<String, dynamic>> otherLocationsData = [
  {
    'title': 'Edmund Street', 'address': 'Birmingham', 'aqi': 3, 'temp': 25,
    'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20),
  },
  {
    'title': 'Berkley Street', 'address': 'Birmingham', 'aqi': 4, 'temp': 30,
    'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20),
  },
  {
    'title': 'Hehe Street', 'address': 'Birmingham', 'aqi': 5, 'temp': 33,
    'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20),
  },
  {
    'title': 'Haha Street', 'address': 'Birmingham', 'aqi': 4, 'temp': 30,
    'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20),
  },
];


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _mainPageController = PageController();
  int _mainCurrentPage = 0;
  
  final PageController _locationsPageController = PageController();
  int _locationsCurrentPage = 0;

  late final PageController _otherLocationsPageController;
  int _otherLocationsCurrentPage = 0;

  @override
  void initState() {
    super.initState();
    _otherLocationsPageController = PageController(viewportFraction: 0.85);
    _mainPageController.addListener(() {
      int nextPage = _mainPageController.page!.round();
      if (_mainCurrentPage != nextPage) {
        setState(() {
          _mainCurrentPage = nextPage;
        });
      }
    });

    _locationsPageController.addListener(() {
      if (_locationsPageController.page?.round() != _locationsCurrentPage) {
        setState(() {
          _locationsCurrentPage = _locationsPageController.page!.round();
        });
      }
    });

    _otherLocationsPageController.addListener(() {
      if (_otherLocationsPageController.page?.round() != _otherLocationsCurrentPage) {
        setState(() {
          _otherLocationsCurrentPage = _otherLocationsPageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    _locationsPageController.dispose();
    _otherLocationsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back 👋',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Anamoul',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1F44),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    controller: _mainPageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const _MainWeatherCard();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _buildPageIndicator(_mainCurrentPage, 3),
                const SizedBox(height: 24),

                SizedBox(
                  height: 110,
                  child: PageView(
                    controller: _locationsPageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: const [
                            Expanded(child: _LocationCard.workHome(
                              title: 'Work', address: 'Coventry ST, Birmingham', aqi: 3, temp: 25,
                            )),
                            SizedBox(width: 16),
                            Expanded(child: _LocationCard.workHome(
                              title: 'Home', address: 'Coventry ST, Birmingham', aqi: 2, temp: 22,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  height: 110,
                  child: PageView.builder(
                    controller: _otherLocationsPageController,
                    clipBehavior: Clip.none,
                    itemCount: otherLocationsData.length,
                    itemBuilder: (context, index) {
                      final location = otherLocationsData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _LocationCard.otherLocation(
                          title: location['title'],
                          address: location['address'],
                          aqi: location['aqi'],
                          temp: location['temp'],
                          rightIcon: location['rightIcon'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _buildPageIndicator(_otherLocationsCurrentPage, otherLocationsData.length),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 2,
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.info_outline, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text('Detail Air Quality', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blueAccent),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int currentPage, int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        bool isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.blueAccent : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _MainWeatherCard extends StatelessWidget {
  const _MainWeatherCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue.shade100.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(Icons.location_on, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Church Street Square', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Birmingham', style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
              ],
            )
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.cloudy_snowing, color: Colors.blueAccent, size: 40),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black, fontFamily: 'sans-serif'),
                          children: [
                            const TextSpan(text: '19', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const TextSpan(text: '°C', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -8),
                                child: const Icon(Icons.arrow_upward, color: Colors.green, size: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Rain Shower', style: TextStyle(color: Colors.black, fontSize: 14)),
                          Text(' Feels like 11°C', style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ]),
                const Row(children: [
                  Text('3', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text('AQI', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(width: 8),
                  _AqiIcon(aqi: 2)
                ])
              ],
            ),
          ),
          Text('Forcast', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: forecastData.map((data) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _ForecastDay(
                    day: data['day'], aqi: data['aqi'], temp: data['temp'], icon: data['icon'],
                  ),
                )).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ForecastDay extends StatelessWidget {
  final String day; final int aqi; final int temp; final IconData icon;
  const _ForecastDay({required this.day, required this.aqi, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(day, style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.bold)),
          _AqiIcon(aqi: aqi, size: 24, showArrow: true),
          Text('${aqi}AQI', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 2),
          Container(height: 1, width: 30, color: const Color.fromARGB(255, 233, 232, 232)),
          const SizedBox(height: 2),
          Icon(icon, color: Colors.blue.shade300, size: 28),
          Text('$temp°C', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title; final String address; final int aqi;
  final int? temp; final Widget? rightIcon;

  const _LocationCard.workHome({
    required this.title, required this.address, required this.aqi, required this.temp,
  }) : rightIcon = null;

  const _LocationCard.otherLocation({
    required this.title, required this.address, required this.aqi, this.temp, this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis),
                  Text(address,
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      overflow: TextOverflow.ellipsis),
                ],
              )),
              if (rightIcon != null) rightIcon!,
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _AqiIcon(aqi: aqi, size: 22),
                  const SizedBox(width: 4),
                  Text('$aqi AQI', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              if (temp != null)
                // SỬA ĐỔI Ở ĐÂY: Dùng điều kiện để quyết định layout
                // Nếu là thẻ otherLocation (có rightIcon), thì hiển thị Text -> Icon
                if (rightIcon != null)
                  Row(
                    children: [
                      Text('$temp°C',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(width: 4),
                      Icon(Icons.cloud_queue_outlined,
                          color: Colors.blue.shade300, size: 20),
                    ],
                  )
                else
                  Row(
                    children: [
                      Icon(Icons.cloud_queue_outlined,
                          color: Colors.blue.shade300, size: 20),
                      const SizedBox(width: 4),
                      Text('$temp°C',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
            ],
          )
        ],
      ),
    );
  }
}

class _AqiIcon extends StatelessWidget {
  final int aqi; final double size; final bool showArrow;
  const _AqiIcon({required this.aqi, this.size = 28, this.showArrow = false});
  
  Color _getAqiColor() {
    if (aqi == 4) return Colors.yellow;
    if (aqi == 3) return const Color.fromARGB(255, 3, 143, 8);
    if (aqi == 2) return const Color.fromARGB(255, 44, 188, 49);
    if (aqi == 1) return const Color.fromARGB(255, 100, 245, 107);
    return Colors.red;
  }
  
  IconData _getAqiFaceIcon() {
    if (aqi <= 2) return Icons.sentiment_very_satisfied;
    if (aqi <= 3) return Icons.sentiment_satisfied;
    if (aqi <= 4) return Icons.sentiment_neutral;
    return Icons.sentiment_dissatisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(color: _getAqiColor(), shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(_getAqiFaceIcon(), color: Colors.white, size: size * 0.65),
          if (showArrow)
            Positioned(
              bottom: size * 0.05,
              child: Icon(Icons.arrow_downward, color: Colors.white, size: size * 0.4),
            ),
        ],
      ),
    );
  }
}