import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController pg = PageController();
  int currentPage = 0;

  final List<String> titles = [
    "Breath Better",
    "Track Pollution",
    "Control Exposure"
  ];

  final List<String> descriptions = [
    "Understand the air around you, wherever you go with the largest coverage of trusted data.",
    "Discover your personal exposure during your daily routine and take action to reduce it.",
    "During your daily routine, discover your personal exposure and take action."
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Login())
                      );
            },
              child: Text("Skip"
                ,style: TextStyle(
                  color: Colors.black
                ),
              ),
            )
          ],
        ),
          body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pg,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                Image.asset('assets/onboard.png',fit: BoxFit.fill,),
                Image.asset('assets/onboard2.png',fit: BoxFit.fill,),
                Image.asset('assets/onboard3.png',fit: BoxFit.fill,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SmoothPageIndicator(
              controller: pg,
              count: 3,
              effect: ExpandingDotsEffect(   
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: 3,
                spacing: 6,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade300,
              ),
            ),
          ),
          Expanded(
            child: Column(
                children: [
                  Text(
                    titles[currentPage],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SF Pro Display"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 4, right: 32, bottom: 150),
                    child: Text(
                      descriptions[currentPage],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "ABeeZee"
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Login())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                      foregroundColor: Colors.white,
                      minimumSize: Size(311, 56),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text("Get Started",
                      style: TextStyle(
                        fontFamily: "SF Pro Display", 
                        fontSize: 16
                      ),
                    )
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}