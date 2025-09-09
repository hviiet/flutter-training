import 'package:flutter/material.dart';
import 'package:practice_flutter/component/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:practice_flutter/provider/tab_index_provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      bottomNavigationBar: Consumer<TabIndexProvider>(
        builder: (context, tabProvider, _) => BottomTabBar(
          currentIndex: tabProvider.tabIndex,
          onTap: (index) => tabProvider.setTab(index, context),
        ),
      ),
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
                CircleAvatar(
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
                    children: [
                      _menuItem(Icons.person, 'Profile'),
                      _menuItem(Icons.location_on, 'Saved Location'),
                      _menuItem(Icons.help_outline, 'FAQ'),
                      _menuItem(Icons.settings, 'Settings'),
                      _menuItem(Icons.info_outline, 'About Us'),
                      _menuItem(Icons.phone, 'Contact Us'),
                      _menuItem(Icons.logout, 'Logout'),
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

  Widget _menuItem(IconData icon, String title) {
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
