import 'package:demo_flutter/Views/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_flutter/blocs/login_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _bloc = LoginBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool rememberMe = false;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    _loadSavedEmail();

    // Lắng nghe kết quả đăng nhập
    _bloc.loginResultStream.listen((success) async {
      if (!mounted) return;
      Navigator.pop(context); // tắt loading dialog

      if (success) {
        if (rememberMe) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('saved_email', _emailController.text);
        }

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const NavigationBarPage()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed. Please try again.")),
        );
      }
    });
  }

  Future<void> _loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email');
    if (savedEmail != null) {
      _emailController.text = savedEmail;
      setState(() {
        rememberMe = true;
      });
    }
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    _bloc.login(email, password); // Gọi bloc xử lý API
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images/login.png", height: 200),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please login to get your local AQI data.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Email field
            StreamBuilder<String>(
              stream: _bloc.userStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: "Email",
                    errorText: snapshot.error?.toString(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Password field
            StreamBuilder<String>(
              stream: _bloc.passStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    labelText: "Your password",
                    errorText: snapshot.error?.toString(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),

            // Remember me & forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text("Remember me"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Login button
            StreamBuilder<bool>(
              stream: _bloc.loadingStream,
              builder: (context, snapshot) {
                final isLoading = snapshot.data ?? false;
                return ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
