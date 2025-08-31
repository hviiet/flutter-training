import 'package:flutter/material.dart';
import 'components/button_more_page.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Stack(
        children: [
          Image.asset('assets/images/background.png'),

          // Menus
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 96, left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                                'assets/images/avatar.png',
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
                            Text(
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
                            Text(
                              'danghuulong394@gmail.com',
                              style: TextStyle(
                                fontFamily: "ABeeZee",
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                height: 1.5,
                                letterSpacing: 0.3,
                                color: const Color.fromRGBO(107, 114, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: const Color.fromRGBO(243, 244, 246, 1),
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        ReusableArrowButton(
                          label: 'Profile',
                          leading: Image.asset('assets/images/profile.png'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
                        ReusableArrowButton(
                          label: 'Saved Location',
                          leading: Image.asset(
                            'assets/images/savedlocation.png',
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
                        ReusableArrowButton(
                          label: 'FAQ',
                          leading: Image.asset('assets/images/FAQ.png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: const Color.fromRGBO(243, 244, 246, 1),
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        ReusableArrowButton(
                          label: 'settings',
                          leading: Image.asset('assets/images/setting.png'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
                        ReusableArrowButton(
                          label: 'About Us',
                          leading: Image.asset('assets/images/aboutus.png'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
                        ReusableArrowButton(
                          label: 'Contact Us',
                          leading: Image.asset('assets/images/contactus.png'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 8),
                        ReusableArrowButton(
                          label: 'Logout',
                          leading: Image.asset('assets/images/logout.png'),
                          onPressed: () {},
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
                          Image.asset('assets/images/logo_fab.png'),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
