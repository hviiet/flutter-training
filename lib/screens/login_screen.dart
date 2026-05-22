import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override 
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRememberMe = false;
  bool isPasswordVisible = false;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(){

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 24),

                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                      width: 260,
                      height: 260,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 38/28,
                      letterSpacing: 0.5,
                      color: Color.fromRGBO(13, 18, 27, 1)
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Please login to get your local AQI data.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:  Color.fromRGBO(34, 34, 34, 1),
                      ),

                      decoration: InputDecoration(
                        hintText: 'Your email',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: Color.fromRGBO(178, 174, 174, 1),
                          size: 24,
                        ),
                        
                        contentPadding: const EdgeInsets.all(16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(209, 209, 209, 1),
                            width: 1,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color:  Color.fromRGBO(51, 141, 244, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
    
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:  Color.fromRGBO(34, 34, 34, 1),
                      ),

                      decoration: InputDecoration(
                        hintText: 'Your password',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        
                        prefixIcon: const Icon(
                          Icons.vpn_key_rounded,
                          color: Color.fromRGBO(178, 174, 174, 1),
                          size: 24,
                        ),

                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          }, 
                          
                          icon: Icon(
                            isPasswordVisible? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Color.fromRGBO(178, 174, 174, 1),
                            size: 24,
                          )
                        ),
                        
                        contentPadding: const EdgeInsets.all(16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(209, 209, 209, 1),
                            width: 1,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color:  Color.fromRGBO(51, 141, 244, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    )
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: Row (
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: isRememberMe, 
                            activeColor: Color.fromRGBO(33, 94, 216, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(173, 168, 168, 1),
                              width: 1,
                            ),

                            onChanged: (value) {
                              setState(() {
                                isRememberMe = value ?? false;
                              });
                            },
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(102, 99, 99, 1),
                          ),
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: () {
                            // forgot password
                          },

                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(42, 141, 255, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: login, 

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(30, 136, 255, 1),
                        foregroundColor: Colors.white,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
