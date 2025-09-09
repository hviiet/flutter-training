import 'package:flutter/material.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<String> images = [
    'assets/onboard.png',
    'assets/onboard2.png',
    'assets/onboard3.png',
  ];

  final List<String> titles = [
    'Breath Better',
    'Track Pollution',
    'Controll Exposure',
  ];

  final List<String> subtitles = [
    'Understand the air around you, wherever you go with the largest coverage of trusted data',
    'Discover personal exposure during your daily routine and take action to reduce it.',
    'During your daily routine, discover personal exposure and take action',
  ];

  void _goLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _next() {
    if (_currentPage == images.length - 1) {
      _goLogin();
    } else {
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: _goLogin, child: const Text('Skip'))],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: Image.asset(images[_currentPage], fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  titles[_currentPage],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    subtitles[_currentPage],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.blue
                      : Colors.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          //  Get Started
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: _next,
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
