import 'dart:ui';

import 'package:flutter/material.dart';

class DataBankPage extends StatefulWidget {
  const DataBankPage({super.key});

  @override
  State<DataBankPage> createState() => _DataBankPageState();
}

class _DataBankPageState extends State<DataBankPage> {
  bool _isRequestSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/icon_earth.png',
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Requet for Data',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'If you would like to download pollutant data, please place your request here. '
                    'We\'ll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      hintText: 'user@email.com',
                    ),
                  ),

                  const SizedBox(height: 4),

                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                      hintText: 'Location',
                    ),
                  ),

                  const SizedBox(height: 4),

                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                      hintText: 'Dates',
                    ),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRequestSent = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Make Request',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (_isRequestSent) ...[
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(color: Colors.white.withValues(alpha: 0.4)),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(color: const Color(0xFF00C853)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),

                      Text(
                        'Request Sent!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Spacer(),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isRequestSent = false;
                          });
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
