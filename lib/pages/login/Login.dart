import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/Home.dart';
import 'package:flutter_application_1/pages/login/Main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidate(String? value){
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? passwordValidate(String? value){
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/login.png"),
          Column(
            spacing: 4.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontFamily: "SF Pro Display"
                ),
              ),
              Text("Please login to get your local AQI data",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "ABeeZee",
                  letterSpacing: 0.5,
                  color: Colors.grey[700]
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_rounded),
                    hintText: "Your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    fontSize: 16,
                  ),
                  validator: emailValidate,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_rounded),
                    hintText: "Your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    fontSize: 16
                  ),
                  validator: passwordValidate,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe, 
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                      Text("Remember me", 
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "ABeeZee"
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text("Forgot password", 
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SF Pro Display",
                          color: Colors.blue[500]
                        ),
                      ),
                    )
                  ],
                ),
                
              ],
            )
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const Main())
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[500],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                minimumSize: Size(327, 56),
              ),
              child: Text("Login", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ),
        ],
      ),
      )
    );
  }
}