import 'package:flutter/material.dart';
import 'package:flutter_training/providers/auth_provider.dart';
import 'package:flutter_training/widgets/app_text_field.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart';

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

  void login(AuthProvider authProvider) async {
    if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    try {
      await authProvider.login(emailController.text.trim(), passwordController.text.trim());
      if (mounted) {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please check your email and password and try again.')),
        );
      }
    }

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

                  AppTextField(
                    controller: emailController, 
                    hintText: 'Your email', 
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 12),
    
                  AppTextField(
                    controller: passwordController, 
                    hintText: 'Your password', 
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isPasswordVisible,

                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },

                      child: Icon(
                        isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),
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
                    child: Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return ElevatedButton(
                          onPressed:  authProvider.isLoading ? null : () => login(authProvider),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(14, 142, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          child: authProvider.isLoading 
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                        );
                      },
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
