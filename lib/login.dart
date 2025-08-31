import 'package:flutter/material.dart';
import 'package:weather_app/rootpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AnimationController _controller;

  String image = 'assets/images/login.png';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  OutlineInputBorder _outline(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    const brandBlue = Color(0xFF1882FF);
    const borderGrey = Color(0xFFE5E7EB);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IMAGE
                SizedBox(
                  height: 260,
                  width: 260,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),

                const SizedBox(height: 16),

                // TITLE + SUBTITLE
                SizedBox(
                  width: 327,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          height: 38 / 28,
                          letterSpacing: 0.5,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Please login to get your local AQI data.',
                        style: TextStyle(
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: Color(0xB81C1C1E),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // INPUTS
                SizedBox(
                  width: 327,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your email',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.email),
                            contentPadding: const EdgeInsets.all(16),
                            border: _outline(borderGrey),
                            enabledBorder: _outline(borderGrey),
                            focusedBorder: _outline(brandBlue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Your password',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: const Icon(Icons.visibility),
                            contentPadding: const EdgeInsets.all(16),
                            border: _outline(borderGrey),
                            enabledBorder: _outline(borderGrey),
                            focusedBorder: _outline(brandBlue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // REMEMBER + FORGOT
                SizedBox(
                  width: 327,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Remember
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 20 / 18,
                            child: Checkbox(
                              value: true,
                              onChanged: (_) {},
                              activeColor: brandBlue,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text('Remember me'),
                        ],
                      ),

                      // Forgot password
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: brandBlue,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 22 / 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // LOGIN BUTTON
                SizedBox(
                  width: 327,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandBlue,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: const Color(
                        0xFF111827,
                      ).withValues(alpha: 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
