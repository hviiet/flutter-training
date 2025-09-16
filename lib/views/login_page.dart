import 'package:flutter/material.dart';
import '../services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final Auth _auth = Auth();
  bool _loading = false;
  String? _error;
  String? _emailError;
  String? _passwordError;

  String image = 'assets/images/login/login.png';

  OutlineInputBorder _outline(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color, width: 1),
      );

  Future<void> _login() async {
    // Reset errors
    setState(() {
      _emailError = null;
      _passwordError = null;
      _error = null;
    });

    // Validate inputs
    final emailError = _auth.validateEmail(_emailController.text);
    final passwordError = _auth.validatePassword(_passController.text);

    if (emailError != null || passwordError != null) {
      setState(() {
        _emailError = emailError;
        _passwordError = passwordError;
      });
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final success = await _auth.login(
        _emailController.text.trim(),
        _passController.text.trim(),
      );

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login thành công!"),
            backgroundColor: Colors.green,
          ),
        );
        // TODO: Navigate to main screen
        // Navigator.pushReplacementNamed(context, '/main');
      } else {
        setState(() {
          _error = "Sai email hoặc mật khẩu";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Lỗi kết nối: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

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
                // Hình login
                SizedBox(
                  height: 260,
                  width: 260,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
                const SizedBox(height: 16),

                // Tiêu đề
                SizedBox(
                  width: 327,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Please login to get your local AQI data.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xB81C1C1E),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Input
                SizedBox(
                  width: 327,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          enabled: !_loading,
                          decoration: InputDecoration(
                            hintText: 'Your email',
                            prefixIcon: const Icon(Icons.email),
                            border: _outline(_emailError != null ? Colors.red : borderGrey),
                            enabledBorder: _outline(_emailError != null ? Colors.red : borderGrey),
                            focusedBorder: _outline(_emailError != null ? Colors.red : brandBlue),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            errorText: _emailError,
                            errorMaxLines: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: _passController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          enabled: !_loading,
                          onSubmitted: (_) => _login(),
                          decoration: InputDecoration(
                            hintText: 'Your password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: const Icon(Icons.visibility),
                            border: _outline(_passwordError != null ? Colors.red : borderGrey),
                            enabledBorder: _outline(_passwordError != null ? Colors.red : borderGrey),
                            focusedBorder: _outline(_passwordError != null ? Colors.red : brandBlue),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            errorText: _passwordError,
                            errorMaxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Nút Login
                SizedBox(
                  width: 327,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _loading ? null : _login,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Login'),
                  ),
                ),

                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
