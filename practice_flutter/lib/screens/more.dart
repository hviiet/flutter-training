import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      // ❌ KHÔNG đặt bottomNavigationBar ở đây
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background.png',
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 48),
                // Avatar
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'),
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
                    children: const [
                      _MenuItem(icon: Icons.person, title: 'Profile'),
                      _MenuItem(
                        icon: Icons.location_on,
                        title: 'Saved Location',
                      ),
                      _MenuItem(icon: Icons.help_outline, title: 'FAQ'),
                      _MenuItem(icon: Icons.settings, title: 'Settings'),
                      _MenuItem(icon: Icons.info_outline, title: 'About Us'),
                      _MenuItem(icon: Icons.phone, title: 'Contact Us'),
                      _MenuItem(icon: Icons.logout, title: 'Logout'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Logo + version
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/airlogo.png', width: 46, height: 46),
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
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
