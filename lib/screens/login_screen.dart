import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = true;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Ảnh phía trên 
                Image.asset(
                  'assets/images/top.png',
                  height: 250,
                  fit:BoxFit.contain,
                ),

                const SizedBox(height: 12),

                // Tiêu đề Login 
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 8),

                //Mô tả
                const Text(
                  'Please Login to get your local AQI data.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,

                  ),
                ),

                const SizedBox(height: 24),

                //Ô nhập địa chỉ email 
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),
                // Ô nhập PassWord
                TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: 'PassWord',
                    prefixIcon: const Icon(Icons.key),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState (() {
                          hidePassword = !hidePassword;
                        });
                      } ,
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        
                      ),
                      ),
                  ),

                ),
                const SizedBox(height: 8,),

                //remember and forgot
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value){
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),

                        const Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      onPressed: (){},
                     child: const Text('Forgot Password'),
                     ),
                  ],
                ),
                const SizedBox(height: 12),

                // Nút Login 
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    child: const Text('Login')
                    ),
                ),

              ],

            ),
          ),
        )
        ),
    );
  }
}