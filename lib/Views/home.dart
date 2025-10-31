import 'package:flutter/material.dart';

final List<Map<String, dynamic>> forecastList = [
  {'day': 'MON', 'aqi': 1, 'temp': 20, 'icon': Icons.wb_cloudy},
  {'day': 'TUE', 'aqi': 2, 'temp': 21, 'icon': Icons.cloud_queue_outlined},
  {'day': 'WED', 'aqi': 3, 'temp': 22, 'icon': Icons.cloudy_snowing},
  {'day': 'THU', 'aqi': 2, 'temp': 21, 'icon': Icons.sunny_snowing},
  {'day': 'FRI', 'aqi': 1, 'temp': 19, 'icon': Icons.cloud_outlined},
  {'day': 'SAT', 'aqi': 2, 'temp': 20, 'icon': Icons.wb_sunny_outlined},
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _weatherController = PageController();
  final PageController _locationController = PageController();
  final PageController _otherLocationController = PageController();

  int currentWeatherPage = 0;
  int currentLocationPage = 0;

  @override
  void initState() {
    super.initState();

    _weatherController.addListener(() {
      setState(() {
        currentWeatherPage = _weatherController.page!.round();
      });
    });

    _locationController.addListener(() {
      setState(() {
        currentLocationPage = _locationController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _weatherController.dispose();
    _locationController.dispose();
    _otherLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello again 👋", style: TextStyle(color: Colors.grey.shade600, fontSize: 17)),
                  const SizedBox(height: 6),
                  const Text("Anamoul", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Color(0xFF0A1F44))),
                ],
              ),
            ),

            // Main weather card pages
            SizedBox(
              height: 320,
              child: PageView.builder(
                controller: _weatherController,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, __) => const MainWeatherCard(),
              ),
            ),

            const SizedBox(height: 12),
            PageDots(currentIndex: currentWeatherPage, count: 3),

            const SizedBox(height: 30),

            // Work & Home cards
            SizedBox(
              height: 110,
              child: PageView(
                controller: _locationController,
                children: const [
                  LocationRow(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Other locations
            SizedBox(
              height: 120,
              child: PageView(
                controller: _otherLocationController,
                physics: const BouncingScrollPhysics(),
                children: const [
                  OtherLocationCard(title: 'Edmund Street', city: 'Birmingham', aqi: 3, temp: 25),
                  OtherLocationCard(title: 'Berkley Street', city: 'Birmingham', aqi: 4, temp: 30),
                  OtherLocationCard(title: 'Lien Chieu', city: 'DaNangCity', aqi: 5, temp: 33),
                  OtherLocationCard(title: 'Tu ha', city: 'Hue', aqi: 4, temp: 29),
                  OtherLocationCard(title: 'Phong Dien', city: 'Hue', aqi: 4, temp: 29),
                ],
              ),
            ),

            const SizedBox(height: 10),
            PageDots(currentIndex: currentLocationPage, count: 4),

            const SizedBox(height: 30),

            // Detail button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                ),
                onPressed: () {},
                icon: const Icon(Icons.info_outline),
                label: const Text(
                  "Air Quality Details",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------
// Small widgets
//--------------------------------------------

class PageDots extends StatelessWidget {
  final int currentIndex;
  final int count;

  const PageDots({super.key, required this.currentIndex, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: i == currentIndex ? 22 : 8,
          decoration: BoxDecoration(
            color: i == currentIndex ? Colors.blueAccent : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------
// Main weather card
//--------------------------------------------
class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.location_on_outlined, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Church Street Square', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('Birmingham', style: TextStyle(color: Colors.grey.shade600)),
            ])
          ]),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.wb_sunny_outlined, color: Colors.orangeAccent, size: 40),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('19°C', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('Feels like 11°C', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                ],
              )
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('3 AQI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                AqiIcon(aqi: 3),
              ],
            ),
          ]),
          const SizedBox(height: 16),
          const Text('Forecast', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: forecastList
                  .map((d) => ForecastItem(day: d['day'], aqi: d['aqi'], temp: d['temp'], icon: d['icon']))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day;
  final int aqi;
  final int temp;
  final IconData icon;

  const ForecastItem({super.key, required this.day, required this.aqi, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        AqiIcon(aqi: aqi, size: 26),
        const SizedBox(height: 4),
        Icon(icon, color: Colors.blueAccent, size: 26),
        const SizedBox(height: 4),
        Text('$temp°C', style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

//--------------------------------------------
// Location Cards
//--------------------------------------------
class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: const [
          Expanded(child: LocationCard(title: 'Work', address: 'Coventry ST', aqi: 3, temp: 25)),
          SizedBox(width: 14),
          Expanded(child: LocationCard(title: 'Home', address: 'Coventry ST', aqi: 2, temp: 22)),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String title;
  final String address;
  final int aqi;
  final int temp;

  const LocationCard({super.key, required this.title, required this.address, required this.aqi, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(address, style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              AqiIcon(aqi: aqi, size: 22),
              const SizedBox(width: 4),
              Text('$aqi AQI', style: const TextStyle(fontWeight: FontWeight.w500)),
            ]),
            Row(children: [
              const Icon(Icons.cloud_queue_outlined, color: Colors.blueAccent, size: 18),
              const SizedBox(width: 4),
              Text('$temp°C', style: const TextStyle(fontWeight: FontWeight.w600)),
            ]),
          ]),
        ],
      ),
    );
  }
}

class OtherLocationCard extends StatelessWidget {
  final String title;
  final String city;
  final int aqi;
  final int temp;

  const OtherLocationCard({
    super.key,
    required this.title,
    required this.city,
    required this.aqi,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: LocationCard(title: title, address: city, aqi: aqi, temp: temp),
    );
  }
}

//--------------------------------------------
// AQI Icon
//--------------------------------------------
class AqiIcon extends StatelessWidget {
  final int aqi;
  final double size;

  const AqiIcon({super.key, required this.aqi, this.size = 28});

  Color _color() {
    switch (aqi) {
      case 1:
        return Colors.green.shade200;
      case 2:
        return Colors.green.shade400;
      case 3:
        return Colors.yellow.shade600;
      case 4:
        return Colors.orange.shade600;
      default:
        return Colors.red.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: _color(), shape: BoxShape.circle),
      child: Icon(Icons.air, color: Colors.white, size: size * 0.6),
    );
  }
}
