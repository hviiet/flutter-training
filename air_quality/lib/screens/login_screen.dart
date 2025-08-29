import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Biến để quản lý trạng thái của checkbox và ẩn/hiện mật khẩu
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // Sử dụng Scaffold để có cấu trúc màn hình cơ bản (app bar, body, v.v.)
    return Scaffold(
      backgroundColor: Colors.white, // Đặt màu nền là màu trắng
      // Body được bọc trong SafeArea để UI không bị che bởi tai thỏ hay thanh trạng thái
      body: SafeArea(
        // SingleChildScrollView cho phép màn hình cuộn khi bàn phím hiện lên
        child: SingleChildScrollView(
          // Padding để tạo khoảng cách giữa nội dung và các cạnh màn hình
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            // Căn chỉnh các thành phần con về phía bên trái
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HÌNH ẢNH
              // Bọc trong Center để hình ảnh nằm giữa theo chiều ngang
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  height: 250, // Chiều cao của ảnh
                ),
              ),
              const SizedBox(height: 40), // Khoảng cách

              // 2. TIÊU ĐỀ "Login"
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8), // Khoảng cách

              // 3. PHỤ ĐỀ
              Text(
                'Please login to get your local AQI data.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700], // Màu xám đậm
                ),
              ),
              const SizedBox(height: 30), // Khoảng cách

              // 4. TRƯỜNG NHẬP LIỆU EMAIL
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), // Icon đầu dòng
                  hintText: 'user@email.com', // Chữ gợi ý
                  border: OutlineInputBorder( // Viền bo tròn
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder( // Viền khi không được chọn
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                keyboardType: TextInputType.emailAddress, // Bàn phím dạng email
              ),
              const SizedBox(height: 16), // Khoảng cách

              // 5. TRƯỜNG NHẬP LIỆU MẬT KHẨU
              TextFormField(
                obscureText: !_isPasswordVisible, // Ẩn/hiện mật khẩu dựa vào biến state
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  // Nút con mắt để ẩn/hiện mật khẩu
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      // Cập nhật trạng thái để vẽ lại UI
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Khoảng cách

              // 6. "REMEMBER ME" & "FORGOT PASSWORD"
              Row(
                // Căn chỉnh 2 cụm con ra 2 phía
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cụm Checkbox và Text
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  // Nút "Quên mật khẩu"
                  TextButton(
                    onPressed: () { },
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Khoảng cách

              // 7. NÚT ĐĂNG NHẬP
              SizedBox(
                width: double.infinity, // Nút chiếm hết chiều ngang
                child: ElevatedButton(
                  onPressed: () {  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Màu nền của nút
                    padding: const EdgeInsets.symmetric(vertical: 16), // Độ cao của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Bo tròn góc nút
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}