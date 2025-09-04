import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/databank/snack_bar.dart';
import 'package:flutter_application_1/pages/home/Home.dart';
import 'package:flutter_application_1/pages/login/navigate.dart';

class DataBank extends StatefulWidget {
  const DataBank({super.key});

  @override
  State<DataBank> createState() => _DataBankState();
}

class _DataBankState extends State<DataBank> {
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  String? emailValidate(String? value){
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? locationValidate(String? value){
    return null;
  }

  Future<void> selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    );

    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 24,
          children: [
            Image.asset("assets/databank.png"),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("Request for Data",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Color(0xFF111827)
                    ),
                  ),
                  Text("If you would like to download pollutant data, please place your request here. We’ll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "ABeeZee",
                      letterSpacing: 0.5,
                      color: Color(0xB81C1C1E)
                    ),
                  )
                ],
              ),
            Form(
              key: formKey,
              child: Column(
                spacing: 8,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: emailValidate,
                    decoration: InputDecoration(
                      hintText: "Your email",
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1882FF)), 
                        borderRadius: BorderRadius.circular(8)
                      ),
                      enabledBorder: OutlineInputBorder( 
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    style: _textStyle(),
                  ),
                  TextFormField(
                    controller: locationController,
                    validator: locationValidate,
                    decoration: InputDecoration(
                      hintText: "Your location",
                      prefixIcon: Icon(Icons.location_on),
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1882FF)), 
                        borderRadius: BorderRadius.circular(8)
                      ),
                      enabledBorder: OutlineInputBorder( 
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    style: _textStyle(),
                  ),
                  TextFormField(
                    onTap: () => selectDate(context),
                    decoration: InputDecoration(
                      hintText: selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : "Choose a date",
                      prefixIcon: Icon(Icons.calendar_today),
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 50,),
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1882FF)), 
                        borderRadius: BorderRadius.circular(8)
                      ),
                      enabledBorder: OutlineInputBorder( 
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    style: _textStyle(),
                  ),
                ],
              )
            ),
            ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  MySnackBar.show(context);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                backgroundColor: Color(0xFF1882FF),
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "SF Pro Display",
                  fontSize: 16,
                  letterSpacing: 0.5
                )
              ), 
              child: Text("Make Request"),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "ABeeZee",
      fontSize: 16,
      letterSpacing: 0.5,
      color: Color(0xFF1C1C1E)
    );
  }
}