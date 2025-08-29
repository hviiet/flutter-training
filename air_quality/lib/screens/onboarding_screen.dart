import 'package:flutter/material.dart';

final List<Map<String, String>> onboardingData = [
  {
    "image": "assets/images/onboarding1.png",
    "title": "Breath Better",
    "description": "Understand the air around you, wherever you go with the largest coverage of trusted AQIs.",
  },
  {
    "image": "assets/images/onboarding2.png",
    "title": "Track Pollution",
    "description": "Discover your personal exposure during your daily routine and take action to reduce it.",
  },
  {
    "image": "assets/images/onboarding3.png",
    "title": "Control Exposure",
    "description": "During your daily routine discover your personal exposure and take action.",
  },
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  // Biến để lưu trang hiện tại
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Lắng nghe sự kiện chuyển trang để cập nhật dấu chấm chỉ báo
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // 1. Nút "Skip"
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                  },
                  child: const Text('Skip', style: TextStyle(fontSize: 16)),
                ),
              ),

              // 2. PageView để hiển thị các màn hình trượt
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      data: onboardingData[index],
                    );
                  },
                ),
              ),

              // 3. Các dấu chấm chỉ báo trang
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => buildDot(index: index),
                ),
              ),
              const SizedBox(height: 40),

              // 4. Nút "Get Started"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }

  // Hàm helper để vẽ các dấu chấm
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6, // Dấu chấm của trang hiện tại sẽ dài hơn
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// Widget con, tái sử dụng cho mỗi trang onboarding
class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Canh lề các phần tử con theo chiều dọc
      mainAxisAlignment: MainAxisAlignment.start, // Bắt đầu từ trên xuống
      children: [
        const Spacer(flex: 2),

        Image.asset(
          data['image']!,
          height: 300, // Giữ chiều cao cố định
          width: double.infinity, // Chiếm hết chiều ngang
          fit: BoxFit.cover,      // Co giãn ảnh cho vừa
        ),
        const SizedBox(height: 40),

        Padding(
          // Thêm padding cho text để không bị sát lề
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Tiêu đề
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
              // Mô tả
              Text(
                data['description']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Phần không gian trống ở dưới
        const Spacer(flex: 3),
      ],
    );
  }
}