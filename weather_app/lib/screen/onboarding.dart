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

            //skip
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child:  Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  }, 
                  child: Text("Skip"),
                )
              ),
            ),

            //pageView
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingData.length,
                onPageChanged: (index){
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index){
                  final item = onboardingData[index];
                  return Image.asset(
                    item["image"]!,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ); 
                }
              )
            ),
            const SizedBox(height: 10,),
            
            //dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length, 
                (index){
                  return Container(
                    margin: EdgeInsets.all(4),
                    width: currentPage == index? 20:8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index? Colors.blue:Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }
              ),
            ),

            const SizedBox(height: 20,),

            //title
            Text(
              onboardingData[currentPage]["title"]!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10,),

            //decs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                onboardingData[currentPage]["desc"]!,
                textAlign: TextAlign.center,
              ),
            ),

            // const Spacer(),

            //button
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 20),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    )
                  ),
                  
                  child: Text("Get Started"),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}