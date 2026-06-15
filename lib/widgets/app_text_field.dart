import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final bool obscureText; //cấu hình ẩn mật khẩu
  final TextInputType? keyboardType; 

  const AppTextField({
    super.key, 
    this.controller, 
    required this.hintText, 
    required this.prefixIcon, 
    this.readOnly = false, 
    this.onTap, 
    this.suffixIcon,
    this.obscureText = false, // Mặc định là hiện chữ
    this.keyboardType,
  });
  
  @override
  Widget build(BuildContext context) {
    // Đã bỏ SizedBox bọc ngoài để tránh lỗi tràn/cắt chữ
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,

      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(17, 24, 39, 1),
      ),

      decoration: InputDecoration(
        isDense: true, // Giúp căn chỉnh padding chuẩn hơn với Icon
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),

        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade400,
        ),

        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey.shade400, 
          size: 20
        ),

        suffixIcon: suffixIcon,

        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromRGBO(13, 125, 246, 1), width: 1.4),
        ),
        
        // Thêm border cho trạng thái lỗi
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.4),
        ),
      ),
    );
  }
}