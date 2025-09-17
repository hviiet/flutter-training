import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'login_page.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/more/background.png',
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 48),
                // Avatar
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/more/avatar.png'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Anamoul Rouf',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  'anamoul.rouf.bd@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                // Menu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _menuItem(context, Icons.person, 'Profile'),
                      _menuItem(context, Icons.location_on, 'Saved Location'),
                      _menuItem(context, Icons.help_outline, 'FAQ'),
                      _menuItem(context, Icons.settings, 'Settings'),
                      _menuItem(context, Icons.info_outline, 'About Us'),
                      _menuItem(context, Icons.phone, 'Contact Us'),
                      _menuItem(context, Icons.logout, 'Logout'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Logo + version
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/more/airlogo.png', width: 46, height: 46),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Air AQ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Version: V 1.1',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          if (title == 'Logout') {
            await _handleLogout(context);
          }
        },
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    // Show confirmation dialog
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Đăng xuất'),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      // Perform logout
      final Auth auth = Auth();
      final bool success = await auth.logout();
      
      if (success) {
        // Navigate to login page and clear all previous routes
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (Route<dynamic> route) => false,
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Có lỗi xảy ra khi đăng xuất. Vui lòng thử lại.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
