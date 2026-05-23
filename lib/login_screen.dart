import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //for checkbox
  bool _remmemberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ), */
      body: SafeArea(
        //child: SingleChildScrollView()
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/login_illustration.png',
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Login',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const Text(
              'Please login to get your local AQI data.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            //Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                prefixIcon: const Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            //password
            TextField(
              controller: _passwordController,
              obscureText: true, //hide password
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 16),

            //checkbox remember me and forgot password
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: _remmemberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _remmemberMe = newValue ?? false;
                        });
                      },
                      activeColor: const Color(0xFF1E88E5),
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    print("Forgot password pressed");
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF1E88E5)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            //Login button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    //todo; logic login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
