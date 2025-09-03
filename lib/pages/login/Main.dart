import 'package:flutter/material.dart';

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