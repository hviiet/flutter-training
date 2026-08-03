import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  static const Color blue = Color(0xff2468df);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 235,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffd9f8ef),
                  Color(0xfff8fffd),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 82,
                    height: 82,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 82,
                        height: 82,
                        color: const Color(0xffd5f4ec),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: blue,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Anamoul Rouf',
                  style: TextStyle(
                    color: Color(0xff141b2b),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'anamoulrouf.bd@gmail.com',
                  style: TextStyle(
                    color: Color(0xff777d88),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              children: [
                MenuItem(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.check_circle,
                  title: 'Saved Location',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.help,
                  title: 'FAQ',
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                MenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.diamond,
                  title: 'About Us',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.phone,
                  title: 'Contact Us',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    showLogoutDialog(context);
                  },
                ),
                const SizedBox(height: 14),
                const Row(
                  children: [
                    Icon(
                      Icons.air,
                      color: Color(0xff00c985),
                      size: 36,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Air AQ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Version: V 1.1',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0d000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: CircleAvatar(
          radius: 12,
          backgroundColor: const Color(0xff2468df),
          child: Icon(
            icon,
            size: 14,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xff1685ff),
        ),
      ),
    );
  }
}