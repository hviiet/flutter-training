import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/more/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Menus
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 96, left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Avatar + name + email
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(224, 246, 238, 1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromRGBO(224, 246, 238, 1),
                                  width: 2,
                                ),
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/more/avatar.png',
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            const Text(
                              'Đặng Hữu Long',
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 1.5,
                                letterSpacing: 0.5,
                                color: Color.fromRGBO(17, 24, 39, 1),
                              ),
                            ),
                            const Text(
                              'danghuulong394@gmail.com',
                              style: TextStyle(
                                fontFamily: "ABeeZee",
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                height: 1.5,
                                letterSpacing: 0.3,
                                color: Color.fromRGBO(107, 114, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(
                      color: Color.fromRGBO(243, 244, 246, 1),
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 16),

                    // ===== Group 1 =====
                    Column(
                      children: [
                        // Profile
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/profile.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Saved Location
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/more/savedlocation.png',
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Saved Location',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // FAQ
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/FAQ.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'FAQ',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(
                      color: Color.fromRGBO(243, 244, 246, 1),
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 16),

                    // ===== Group 2 =====
                    Column(
                      children: [
                        // Settings
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/setting.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'settings',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // About Us
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/aboutus.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'About Us',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Contact Us
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/contactus.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Logout
                        Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/more/logout.png'),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.96),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/more/right_arrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Version
                    SizedBox(
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/more/logo_fab.png'),
                          const SizedBox(width: 16),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Air AQ',
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  color: Color.fromRGBO(17, 24, 39, 1),
                                ),
                              ),
                              Text(
                                'Version: V 1.1',
                                style: TextStyle(
                                  fontFamily: "ABeeZee",
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  height: 1.5,
                                  letterSpacing: 0.3,
                                  color: Color.fromRGBO(107, 114, 128, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
