import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/databank/DataBank.dart';
import 'package:flutter_application_1/pages/home/Home.dart';
import 'package:flutter_application_1/pages/more/More.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int current_page = 0;
  @override
  Widget build(BuildContext context) {
    

    final List<Widget> pages = [
      Home(),
      DataBank(),
      More()
    ];

    void onTap(int index){
      setState(() {
        current_page = index;
      });
    }
    return Scaffold(
      body: pages[current_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF1882FF),
        currentIndex: current_page,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt_rounded),
            label: "Data Bank"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More"
          )
        ]
      ),
    );
  }
}