import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login/login.dart';
import 'package:flutter_application_1/pages/more/more_item.dart';
import 'package:flutter_application_1/providers_and_state/user_provider.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset("assets/backbround.png",fit: BoxFit.cover,width: double.infinity,),
                Padding(
                  padding: const EdgeInsets.only(top: 104, left: 24, right: 24),
                  child: Column(
                    spacing: 8,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: (userProvider.avatarUrl != null)?NetworkImage(userProvider.avatarUrl!):null,
                            backgroundColor: Color(0xFFE0F6EE),
                            child: (userProvider.avatarUrl != null)?null:CircularProgressIndicator(strokeWidth: 2,),
                          ),
                          Column(
                            children: [
                              Text(userProvider.name ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "SF Pro Display",
                                  fontSize: 20,
                                  letterSpacing: 0.5
                                ),
                              ),
                              Text(userProvider.mail ?? "",
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
                          border: Border.all(width: 1,color: Color(0xFFF3F4F6))
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            MoreItem(text: "Profile", prefixIcon: Icons.account_box_rounded, onPressed: (){}),
                            MoreItem(text: "Save Location", prefixIcon: Icons.location_on_rounded, onPressed: (){}),
                            MoreItem(text: "FAQ", prefixIcon: Icons.question_mark_rounded, onPressed: (){}),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFF3F4F6))
                        ),
                      ),
                      SizedBox(
                        height: 265,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            MoreItem(text: "Settings", prefixIcon: Icons.settings, onPressed: (){}),
                            MoreItem(text: "About Us", prefixIcon: Icons.diamond_sharp, onPressed: (){}),
                            MoreItem(text: "Contact Us", prefixIcon: Icons.call_rounded, onPressed: (){}),
                            MoreItem(text: "Logout", prefixIcon: Icons.logout_outlined, onPressed: (){
                              Auth().logout();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => Login())
                              );
                            },),
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
          ),
        );
      },
    );
  }
}