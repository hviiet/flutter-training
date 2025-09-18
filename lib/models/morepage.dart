import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/prfbgr.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/prf.png'),
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
      ],
    );
  }

  /// Danh sách menu
  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 10),

          const MenuItem(icon: Icons.person_outline, title: 'Profile'),
          const MenuItem(icon: Icons.bookmark_border, title: 'Saved Location'),
          const MenuItem(icon: Icons.help_outline, title: 'FAQ'),

          const SizedBox(height: 10),
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 10),

          const MenuItem(icon: Icons.settings_outlined, title: 'Settings'),
          const MenuItem(icon: Icons.info_outline, title: 'About Us'),
          const MenuItem(icon: Icons.phone_outlined, title: 'Contact Us'),
          const MenuItem(icon: Icons.logout, title: 'Logout'),
        ],
      ),
    );
  }

  /// Footer logo + version
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logoair.png',
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
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.5,
      shadowColor: Colors.black.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          
        },
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.blue,
        ),
      ),
    );
  }
}
