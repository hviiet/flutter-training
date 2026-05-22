import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  final List<Map<String, String>> onboardingItems = [
    {
      'image': 'assets/images/onboarding_1.png',
      'title': 'Breath Better',
      'description': 'Understand the air around you, wherever you go with the largest coverage of trusted data.',
    },
    {
      'image': 'assets/images/onboarding_2.png',
      'title': 'Track Pollution',
      'description': 'Discover your personal exposure during your daily routine and take action to reduce it',
    },
    {
      'image': 'assets/images/onboarding_3.png',
      'title': 'Controll Exposure',
      'description': 'During your daily routine, discover your personal exposure and take action.',
    },
  ];

  void goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: goToLoginScreen,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: onboardingItems.length,

                itemBuilder: (context, index) {
                  final item = onboardingItems[index];

                  return Column(
                    children: [
                      Image.asset(
                        item['image']!,
                        width: double.infinity,
                        height: 326,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(height: 80),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingItems.length, 
                          (dotIndex) {
                            bool isActive = dotIndex == currentPage;

                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: isActive? 24 : 8,
                              height: 6,
                              decoration: BoxDecoration(
                                color: isActive? Color.fromRGBO(1, 111, 255, 1) : Color.fromRGBO(151, 173, 218, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }
                        ),
                      ),

                      const Spacer(),

                      Text(
                        item['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          height: 38/28,
                          letterSpacing: 0.5,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          item['description']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 22 / 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: 311,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: goToLoginScreen,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  const Color.fromRGBO(30, 136, 255, 1),
                            foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50)
                    ],
                  );
                }
              ),
            ),
          ],     
        ),
      ),
    );
  }
}