import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/databank/data_bank.dart';
import 'package:flutter_application_1/pages/home/home.dart';
import 'package:flutter_application_1/pages/more/more.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    

    final List<Widget> pages = [
      Home(),
      DataBank(),
      More()
    ];

    void onTap(int index){
      setState(() {
        currentPage = index;
      });
    }
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF1882FF),
        currentIndex: currentPage,
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