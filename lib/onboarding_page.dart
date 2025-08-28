import 'package:flutter/material.dart';
import 'package:flutter_training/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;

  final List<String> images = [
    'assets/images/OBleft.png',
    'assets/images/OBmid.png',
    'assets/images/OBright.png',
  ];
  final List<String> title = [
    'Breath Better',
    'Track Pollution',
    'Controll Exposure',
  ];
  final List<String> content = [
    'Understand the air around you, wherever you go with the largest coverage of trusted data.',
    'Discover your personal exposure during your daily routine and take action to reduce it',
    'During your daily routine, discover your personal exposure and take action',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Login()),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromRGBO(28, 28, 30, 0.72),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: const StadiumBorder(),
            ),
            child: const Text(
              'Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        Expanded(
                          child: Image.asset(
                            images[i],
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            title[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              height: 38 / 28,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            content[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 22 / 14,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (j) {
                        final isActive = _index == j;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          width: isActive ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFF1882FF)
                                : const Color(0xFFD1D5DB),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1882FF),
                          foregroundColor: Colors.white,
                          elevation: 10,
                          shadowColor: const Color.fromRGBO(
                            17,
                            24,
                            39,
                            0.1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const Login(),
                            ),
                          );
                        },
                        child: const Text('Get Started'),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
