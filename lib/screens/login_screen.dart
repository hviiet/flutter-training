import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_flow_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = true;
  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appFlow = context.watch<AppFlowProvider>();

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
                  controller: emailController,
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
                  controller: passwordController,
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
                     child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                     ),
                  ],
                ),
                const SizedBox(height: 12),

                if (appFlow.errorMessage != null) ...[
                  Text(
                    appFlow.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 12),
                ],

                // Nút Login 
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: appFlow.isLoggingIn ? null : handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1882FF),
                      foregroundColor: Colors.white,
                      elevation: 7,
                      shadowColor: const Color.fromRGBO(
                        33, 
                        133,
                         245,
                          0.3,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ), 
                       ),
                    child: appFlow.isLoggingIn
                      ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                    
                        ),
                      )
                      : const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),

              ],

            ),
          ),
        )
        ),
    );
  }


  Future<void> handleLogin() async {
  final email = emailController.text.trim();
  final password = passwordController.text;

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Vui lòng nhập đầy đủ email và mật khẩu')),
    );
    return;
  }

  await context.read<AppFlowProvider>().login(
    email: email,
    password: password,
  );
}
}

