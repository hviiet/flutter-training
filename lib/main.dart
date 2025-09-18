import 'package:demo_flutter/models/home.dart';
import 'package:demo_flutter/models/morepage.dart';
import 'package:demo_flutter/models/navigationbar.dart';

import 'models/databank.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: NavigationBarExample(),
    );
  }
}
