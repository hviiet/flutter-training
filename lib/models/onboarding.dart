import 'package:flutter/material.dart';
import 'login.dart'; 

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    'Breath Better',
    'Track Pollution',
    'Control Exposure',
  ];

  final List<String> descriptions = [
    'Understand the air around you, wherever you go with the largest coverage of trusted data.',
    'Discover your personal exposure during your daily routine and take action to reduce it.',
    'During your daily routine, discover your personal exposure and take action.',
  ];

  final List<String> images = [
    'assets/images/ob1.png',
    'assets/images/ob2.png',
    'assets/images/ob3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
            
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: titles.length,
              onPageChanged: (i) {
                setState(() {
                  _currentPage = i;
                });
              },
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      child: Expanded(
                        child: Image.asset(images[i],fit: BoxFit.cover, width: double.infinity,),
                      ),
                    ),
                    const SizedBox(height: 110),
                    Text(
                      titles[i],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        descriptions[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              titles.length,
              (i) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == i ? 12 : 8,
                height: _currentPage == i ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == i ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Get Started button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: const Text("Get Started",
              style: TextStyle(color: Colors.white),
                ),
                ),
            ),
        ],
      ),
    );
  }
}
