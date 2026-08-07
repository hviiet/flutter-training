import 'package:flutter/material.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        surfaceTintColor: const Color(0xFFF9F9F9),
        centerTitle: false,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Current Location ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              ),
          ], 
        ),
        leading: IconButton(
          onPressed: () =>Navigator.pop(context), 
          icon: const Icon(Icons.chevron_left),
          ),
          actions: [
            Icon(Icons.my_location_outlined, size: 20,),
          ],
        

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(

            ),
            ),
        ),
      ),
    );
  }
}