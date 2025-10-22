import 'package:flutter/material.dart';
import 'package:flutter_training/utils/navigation_helper.dart';
import 'package:flutter_training/views/aqi_scale_page.dart';

/// Example widget showing how to integrate the new Location Details and AQI Scale screens
/// Chỉ cần Weather API - không cần Air Quality API nữa!
class LocationIntegrationExample extends StatelessWidget {
  const LocationIntegrationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location & AQI Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Test Location Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Weather API bao gồm cả Air Quality data!',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            
            // Example 1: Navigate to Birmingham
            ElevatedButton(
              onPressed: () {
                NavigateToLocationDetail.navigate(context, 'Birmingham');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('🇬🇧 Birmingham, UK'),
            ),
            const SizedBox(height: 8),
            
            // Example 2: Navigate to London
            ElevatedButton(
              onPressed: () {
                NavigateToLocationDetail.navigate(context, 'London');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('🇬🇧 London, UK'),
            ),
            const SizedBox(height: 8),
            
            // Example 3: Navigate to Hanoi
            ElevatedButton(
              onPressed: () {
                NavigateToLocationDetail.navigate(context, 'Hanoi');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('🇻🇳 Hanoi, Vietnam'),
            ),
            const SizedBox(height: 8),
            
            // Example 4: Navigate to New York
            ElevatedButton(
              onPressed: () {
                NavigateToLocationDetail.navigate(context, 'New York');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('🇺🇸 New York, USA'),
            ),
            
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            
            const Text(
              'View AQI Scale Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Navigate to AQI Scale page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AQIScalePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('📊 View AQI Scale'),
            ),
            
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            
            // Information card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'Đã cập nhật!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '✅ Chỉ cần Weather API\n'
                    '✅ API key đã được thêm\n'
                    '✅ Air Quality data từ Weather API\n'
                    '✅ Không cần aqicn.org API\n\n'
                    '🔑 API Key: 30890248d8d5463593485407252210',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
