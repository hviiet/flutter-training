import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscureText = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),

                ///image
                Center(
                  child: Image.asset("lib/assets/images/login.png", height: 220,),
                ),
                SizedBox(height: 30,),

                ///title
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),

                const Text(
                  "Please login to get your local AQI data.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 30,),

                ///email
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),

                SizedBox(height: 20,),

                ///password
                TextField(
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          obscureText = !obscureText;
                        });
                      }, 
                      icon: Icon(obscureText? Icons.visibility: Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),

                SizedBox(height: 20,),

                ///rememberMe
                Row(
                  children: [
                    Checkbox(value: rememberMe, onChanged: (value){
                      setState(() {
                        rememberMe = value!;
                      });
                    }),

                    const Text("Remember me"),

                    Spacer(), //lấy hết khoảng trống ở giữa
                    TextButton(onPressed: (){},
                      child: const Text("Forgot password?"),
                    )
                  ],
                ),

                SizedBox(height: 30,),
                ///loging button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(onPressed: (){}, child: Text("Login"), 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                  ),
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}