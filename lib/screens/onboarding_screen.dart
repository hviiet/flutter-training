import 'package:flutter/material.dart';
import 'package:onboarding_app/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

final List<Map<String, String>> onboardingData = [
  {
  "image": "assets/images/onboarding_1.png",
      "title":"Breath Better",
      "description": "Understand the air around you, wherever you go with the largest coverage of trusted data."
  },
  {
    "image": "assets/images/onboarding_2.png",
    "title": "Track Pollution",
    "description": "Discover your personal exposure during your daily routine and take action to reduce it.",
  },
  {
    "image": "assets/images/onboarding_3.png",
    "title": "Control Exposure",
    "description": "During your daily routine discover your personal exposure and take action.",
  },
];



class _OnboardingScreenState extends State<OnboardingScreen> {
   final PageController _pageController = PageController();

  // Lưu vị trí trang hiện tại
  int _currentPage = 0;

  // Kiểm tra có đang ở trang cuối hay không
  bool get isLastPage {
    return _currentPage == onboardingData.length - 1;
  }

  void nextPage(){
    if(!isLastPage){
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
    else {
      finishOnboarding();
    }
  }



  //Bỏ qua onboarding sang màn login
  void finishOnboarding(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
         ),
    );
  }


  @override
  void dispose(){
    //Giải phóng khi màn hình bị đóng
  _pageController.dispose();
  super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            children: [
              // Button skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: finishOnboarding,
                  child: const Text(
                   'Skip',
                   style: TextStyle(
                     fontSize:16,
                     color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                 ),
                ),

              ),


              // Hiển thị các trang onboarding
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  // cập nhật vị trí trang hiện tại 
                  onPageChanged: (index) {
                    setState (() {
                      _currentPage = index ;

                    });
                  },
                  itemBuilder: (context, index){
                    return OnboardingPage(
                      data: onboardingData[index],
                      indicator: _buildPageIndicator(),
                    );
                  },
                  
                ), 
              ),

                const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: nextPage, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1882FF),
                        foregroundColor: Colors.white,
                        elevation: 7,
                        shadowColor: const Color.fromRGBO(
                          33, 
                          133,
                           245,
                            0.3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ), 
                         ),
                         //Trang cuoi hien thi Get Started

                         child: Text(
                          isLastPage ? 'Get Started' : 'Get Started',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),

                         ),
                      ),
                  ),
            ],

          ),
        
        ),
      ),
    );
  }

  //Widget tạo dấu 3 chấm
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => buildDot(index: index),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    final bool isSelected = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 3), 
      height: 6,
      width: isSelected ? 20 : 6,
      decoration: BoxDecoration(
        color: isSelected
        ? const Color(0xFF2185F5)
        : const Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(10), 
      ),
    );
  } 
}

//Widget tái sử dụng cho tất cả các trang onboarding
class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;
  final Widget indicator;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: Image.asset(
              data['image']!,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),

        const SizedBox(height: 20),

        indicator,

        const SizedBox(height: 24),

        Text(
          data['title']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            data['description']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Color(0xFF757575),
            ),
          ),
        ),

        const SizedBox(height: 18),
      ],
    );
  }
}
