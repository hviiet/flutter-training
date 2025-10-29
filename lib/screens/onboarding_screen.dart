import 'package:flutter/material.dart';
// Import LoginScreen
import 'package:air_quality/screens/login_screen.dart';

final List<Map<String, String>> onboardingData = [
  {
    "image": "assets/images/onboarding1.png",
    "title": "Breath Better",
    "description":
        "Understand the air around you, wherever you go with the largest coverage of trusted AQIs.",
  },
  {
    "image": "assets/images/onboarding2.png",
    "title": "Track Pollution",
    "description":
        "Discover your personal exposure during your daily routine and take action to reduce it.",
  },
  {
    "image": "assets/images/onboarding3.png",
    "title": "Control Exposure",
    "description":
        "During your daily routine discover your personal exposure and take action.",
  },
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Hàm chuyển sang màn hình Login
  void _goToLoginScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                // SỬA Ở ĐÂY: Gọi hàm _goToLoginScreen khi nhấn Skip
                onPressed: _goToLoginScreen,
                child: const Text('Skip', style: TextStyle(fontSize: 16)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingData[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index: index),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToLoginScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(flex: 2),
        Image.asset(
          data['image']!,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                data['title']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                data['description']!,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}