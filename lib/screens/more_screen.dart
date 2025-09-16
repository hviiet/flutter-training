import 'package:flutter/material.dart';

import 'package:air_quality/screens/storage_service.dart';
import 'package:air_quality/screens/login_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final StorageService _storageService = StorageService();

  /// Hàm xử lý logic đăng xuất
  Future<void> _logout() async {
    await _storageService.clearTokens();

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.grey[100],
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/profile_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          Positioned(
            top: 100,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Anamoul Rouf',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'anamoulrouf.bd@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget xây dựng danh sách các mục menu
  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Divider(color: const Color.fromARGB(255, 241, 240, 240), thickness: 1, height: 20),
          // Các mục này chưa có chức năng, nên onTap là một hàm rỗng
          _item(icon: Icons.person_outline, title: 'Profile', onTap: () {}),
          _item(icon: Icons.bookmark_border, title: 'Saved Location', onTap: () {}),
          _item(icon: Icons.help_outline, title: 'FAQ', onTap: () {}),

          const SizedBox(height: 10),
          Divider(color:const Color.fromARGB(255, 241, 240, 240), thickness: 1, height: 20),
          const SizedBox(height: 10),

          _item(icon: Icons.settings_outlined, title: 'Settings', onTap: () {}),
          _item(icon: Icons.info_outline, title: 'About Us', onTap: () {}),
          _item(icon: Icons.phone_outlined, title: 'Contact Us', onTap: () {}),
          // Gắn hàm _logout vào sự kiện onTap của mục 'Logout'
          _item(icon: Icons.logout, title: 'Logout', onTap: _logout),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_air_quality.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Air AQ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Version: V 1.1',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Widget tùy chỉnh cho mỗi mục trong danh sách menu
class _item extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _item({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      // Card để tạo hiệu ứng nổi và bo góc
      child: Card(
        color: Colors.white,
        elevation: 1.5,
        shadowColor: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          onTap: onTap, // Gán hàm onTap vào đây
          // Icon bên trái
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.blue),
          ),
          // Tiêu đề
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          // Icon mũi tên bên phải
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}