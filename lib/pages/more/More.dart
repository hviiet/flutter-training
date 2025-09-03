import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/more/MoreItem.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/backbround.png",fit: BoxFit.cover,width: double.infinity,),
          Padding(
            padding: const EdgeInsets.only(top: 104, left: 24, right: 24),
            child: Column(
              spacing: 8,
              children: [
                Column(
                  children: [
                    Image.asset("assets/avater.png"),
                    Column(
                      children: [
                        Text("Anamoul Rouf",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "SF Pro Display",
                            fontSize: 20,
                            letterSpacing: 0.5
                          ),
                        ),
                        Text("anamoulrouf.bd@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                            fontSize: 12,
                            letterSpacing: 0.3,
                            color: Color(0xFF6B7280)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 0,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 1,color: Color(0xFFF3F4F6))
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Moreitem(text: "Profile", prefixIcon: Icons.account_box_rounded),
                      Moreitem(text: "Save Location", prefixIcon: Icons.location_on_rounded),
                      Moreitem(text: "FAQ", prefixIcon: Icons.question_mark_rounded),
                    ],
                  ),
                ),
                 Container(
                  width: double.infinity,
                  height: 0,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 1,color: Color(0xFFF3F4F6))
                  ),
                ),
                SizedBox(
                  height: 265,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Moreitem(text: "Settings", prefixIcon: Icons.settings),
                      Moreitem(text: "About Us", prefixIcon: Icons.diamond_sharp),
                      Moreitem(text: "Contact Us", prefixIcon: Icons.call_rounded),
                      Moreitem(text: "Logout", prefixIcon: Icons.logout_outlined),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset("assets/fab.png"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Air AQ",
                          style: TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: Color(0xFF111827)
                          ),
                        ),
                        Text("Version: V 1.1",
                          style: TextStyle(
                            fontFamily: "ABeeZee",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            color: Color(0xFF6B7280)
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}