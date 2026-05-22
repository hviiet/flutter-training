import 'package:flutter/material.dart';
import 'package:weather_app/screen/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> onboardingData = [
    {
      "image": "lib/assets/images/onboarding1.png",
      "title":"Breath Better",
      "desc": "Understand the air around you, wherever you go with the largest coverage of trusted data."
    },
    {
      "image": "lib/assets/images/onboarding2.png",
      "title":"Track Pollution",
      "desc": "Discover pollution exposure during your daily rountine and take action to reduce it."
    },
    {
      "image": "lib/assets/images/onboarding3.png",
      "title":"Controll Exposure",
      "desc": "During your daily rountine discover your personal exposure and take action"
    },
  ];

  int currentPage = 0;
  final PageController controller = PageController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            //page view
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index){
                  final item = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("Skip"),
                        ),

                        Expanded(
                          child: Image.asset(item["image"]!)
                        ),

                        Text(
                          item["title"]!,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 16,),

                        Text(item["desc"]!, textAlign: TextAlign.center,)

                      ],
                    ),
                  );
                },
              )
            ),

            //Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index){
                  return Container(
                    margin: EdgeInsets.all(4),
                    width: currentPage == index ?20:8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }
              ),
            ),

            SizedBox(height: 30,),

            ///Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Get Started")
                ),
              ),
            )

          ],
        )
      )
    );
  }
}