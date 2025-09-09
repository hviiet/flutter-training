import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

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
      children: [
        Image.asset(
            'assets/images/profile_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        
        Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 20, left: 100, right: 16),
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

           Divider(
              color: Colors.grey[300],
              thickness: 1,          
              height: 20,
            ),

          _item(icon: Icons.person_outline, title: 'Profile'),
          _item(icon: Icons.bookmark_border, title: 'Saved Locaiton'),
          _item(icon: Icons.help_outline, title: 'FAQ'),

          const SizedBox(height: 10),
           Divider(
              color: Colors.grey[300],
              thickness: 1,          
              height: 20,
            ),
            const SizedBox(height: 10),

          _item(icon: Icons.settings_outlined, title: 'Settings'),
          _item(icon: Icons.info_outline, title: 'About Us'),
          _item(icon: Icons.phone_outlined, title: 'Contact Us'),
          _item(icon: Icons.logout, title: 'Logout'),
        ],
      ),
    );
  }

  /// Widget xây dựng phần Footer với logo và phiên bản ứng dụng
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        spacing: 12,
        children: [
          Image.asset( 
            'assets/images/logo_air_quality.png',
            width: 50,
            height: 50,
          ),
          Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Air AQ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
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

class _item extends StatelessWidget {
  final IconData icon;
  final String title;

  const _item({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      // Card để tạo hiệu ứng nổi và bo góc
      child: Card(
        color: Colors.white,
        elevation: 1.5,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          onTap: () {
            // Coding blabla
          },
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