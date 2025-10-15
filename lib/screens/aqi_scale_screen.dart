import 'package:flutter/material.dart';

class AqiScaleScreen extends StatelessWidget {
  const AqiScaleScreen({Key? key}) : super(key: key);

  String _getAqiFaceIconPath(String level) {
    switch (level) {
      case 'Low':
        return 'assets/images/low.png';
      case 'Moderate':
        return 'assets/images/moderate.png';
      case 'High':
        return 'assets/images/high.png';
      case 'Very High':
        return 'assets/images/very_high.png';
      default:
        return 'assets/images/low.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)
        ),
        title: const Text('AQI Scale', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCurrentStatusHeader(),
              const SizedBox(height: 20),
              _buildAqiScaleItem(
                level: 'Low',
                color: Colors.green,
                range: '1 to 3',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically affect air quality forecasts within hours or even minutes.',
              ),
              const SizedBox(height: 16),
              _buildAqiScaleItem(
                level: 'Moderate',
                color: Colors.orange,
                range: '4 to 6',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
              const SizedBox(height: 16),
              _buildAqiScaleItem(
                level: 'High',
                color: Colors.red,
                range: '7 to 8',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
              const SizedBox(height: 16),
              _buildAqiScaleItem(
                level: 'Very High',
                color: Colors.purple,
                range: '9 to 10',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStatusHeader() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon( Icons.location_searching, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Church Street Square', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Birmingham', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset('assets/images/rain_shower.png', width: 24, height: 24),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('19', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              const Text('°C', style: TextStyle(color: Colors.grey, fontSize: 18)),
                              const SizedBox(width: 4),
                              Icon(Icons.arrow_upward, size: 16, color: Colors.grey),
                            ],
                          ),
                          Text.rich(TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(text: 'Rain Shower ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'Feels like 11°C', style: TextStyle(color: Colors.grey[600])),
                              ]))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('3', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 2),
                  child: Text('AQI', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(4),
                  
                  child: Image.asset(_getAqiFaceIconPath('Low'), width: 28, height: 28, color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAqiScaleItem({
    required String level,
    required Color color,
    required String range,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(_getAqiFaceIconPath(level), width: 30, height: 30, color: color),
                const SizedBox(width: 12),
                Text(level, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Text('Air Quality Index: $range', style: const TextStyle( fontWeight: FontWeight.bold, color:Colors.grey)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('Show More', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}