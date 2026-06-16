import 'package:dashboard_databank_more/util/aq_forcast.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ForcastDay> _forcastList = [
    ForcastDay(
      day: 'MON',
      aqi: '1 AQI',
      temperature: '20°C',
      aqiIcon: 'assets/images/aq_status_happy.png',
      weatherIcon: 'assets/images/weather_icons_cloudy.png',
    ),
    ForcastDay(
      day: 'TUE',
      aqi: '2 AQI',
      temperature: '17°C',
      aqiIcon: 'assets/images/aq_status_good.png',
      weatherIcon: 'assets/images/weather_icons_rain.png',
    ),
    ForcastDay(
      day: 'WED',
      aqi: '3 AQI',
      temperature: '25°C',
      aqiIcon: 'assets/images/aq_status_normal.png',
      weatherIcon: 'assets/images/weather_icons_cloudy.png',
    ),
    ForcastDay(
      day: 'THU',
      aqi: '2 AQI',
      temperature: '22°C',
      aqiIcon: 'assets/images/aq_status_good.png',
      weatherIcon: 'assets/images/weather_icons_cloudy.png',
    ),
    ForcastDay(
      day: 'FRI',
      aqi: '1 AQI',
      temperature: '21°C',
      aqiIcon: 'assets/images/aq_status_happy.png',
      weatherIcon: 'assets/images/weather_icons_sunny.png',
    ),
    ForcastDay(
      day: 'SAT',
      aqi: '2 AQI',
      temperature: '24°C',
      aqiIcon: 'assets/images/aq_status_good.png',
      weatherIcon: 'assets/images/weather_icons_party_cloudy.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              const Text(
                'Anomoul',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              //du bao chinh
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 249, 249, 249),
                      Color.fromARGB(255, 164, 189, 227),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gps.png', width: 64),

                        const Text(
                          'Church Street Square\nBirmingham',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/weather_icons_rain.png',
                                    width: 50,
                                  ),

                                  const SizedBox(height: 8),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '19°C',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          const Text('Rain Shower'),
                                          const Text(
                                            'Feels like 11°C',
                                            style: TextStyle(fontSize: 12),
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

                        const SizedBox(height: 4),

                        Text('3 AQI', style: TextStyle(fontSize: 22)),
                        const SizedBox(width: 2),
                        Image.asset(
                          'assets/images/aq_status_normal.png',
                          width: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              //
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _forcastList.length,
                  itemBuilder: (context, index) {
                    return AqForcast(forcast: _forcastList[index]);
                  },
                ),
              ),

              const SizedBox(height: 24),

              //List location
              const Text(
                'Nearby places',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Work', style: TextStyle(fontSize: 14)),
                        Text(
                          'Conventry ST, Bermingham',
                          style: TextStyle(fontSize: 12),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/aq_status_normal.png',
                                ),
                                Text('3 AQI'),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/weather_icons_rain.png',
                                ),
                                Text('25°C'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Home', style: TextStyle(fontSize: 14)),
                        Text(
                          'Conventry ST, Bermingham',
                          style: TextStyle(fontSize: 12),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/aq_status_good.png'),
                                Text('2 AQI'),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/weather_icons_rain.png',
                                ),
                                Text('22°C'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildLocationCard(
                        title: 'Edmund Street',
                        address: 'BirMingham',
                        aqi: '5 AQI',
                        temp: '21°C',
                        aqiStatus: 'bad',
                      ),
                      const SizedBox(height: 12),
                      _buildLocationCard(
                        title: 'Berkley Street',
                        address: 'BirMingham',
                        aqi: '4 AQI',
                        temp: '',
                        aqiStatus: 'good',
                        showTemp: false,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Detail Air Quality pressed"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    elevation: 0,
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Detail Air Quality',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard({
    required String title,
    required String address,
    required String aqi,
    required String temp,
    required String aqiStatus,
    bool showTemp = true,
  }) {
    String aqiIcon;
    switch (aqiStatus) {
      case 'good':
        aqiIcon = 'assets/images/aq_status_good.png';
        break;
      case 'bad':
        aqiIcon = 'assets/images/aq_status_terrible.png';
        break;
      default:
        aqiIcon = 'assets/images/aq_status_happy.png';
    }

    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(aqiIcon, width: 24),
              const SizedBox(width: 8),
              Text(aqi, style: const TextStyle(fontWeight: FontWeight.w500)),
              if (showTemp) ...[
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    temp,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
