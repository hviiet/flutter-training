import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentpage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/illustration_full_1.png",
      "title": "Breath Better",
      "description":
          "Understand the air around you, wherever you go with the largest coverage of trusted data.",
    },
    {
      "image": "assets/images/illustration_full_2.png",
      "title": "Track Pollution",
      "description":
          "Discover your personal exposure during your daily routine and take action to reduce it.",
    },
    {
      "image": "assets/images/illustration_full_3.png",
      "title": "Controll Exposure",
      "description":
          "During you daily routine, discover your personal exposure and take action.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    //lay kich thuoc theo man hinh thiet bi
    final sz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //nut skip, prev o tren
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentpage > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "Prev",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : const SizedBox(width: 60),

                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(_onboardingData.length - 1);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentpage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Hien thi anh thay doi theo tung trang
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          _onboardingData[index]["image"]!,
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _onboardingData.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            //Dau cham cua trang hien tai se dai ra 24px, trang khac hinh tron
                            width: _currentpage == dotIndex ? 24 : 8,
                            decoration: BoxDecoration(
                              color: _currentpage == dotIndex
                                  ? const Color(0xFF1E88E5)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      //Tieu de
                      Text(
                        _onboardingData[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      //Desciption
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          _onboardingData[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            //Nut bam next or get started
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentpage < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    _currentpage == _onboardingData.length - 1
                        ? "Get Startted"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
