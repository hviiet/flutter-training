import 'package:flutter/material.dart';
import 'package:flutter_training/providers/auth_provider.dart';
import 'package:flutter_training/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/action_list_tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/more_background.png',
                  width: double.infinity,
                  height: 188,
                  fit: BoxFit.cover,
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 92, 24, 24),
                  child: Column(
                    children: [
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                          final userProfile = authProvider.userProfile;
                          if (userProfile == null) {
                            return const CircularProgressIndicator();
                          } else {
                            return Column(
                              children: [
                                _Avatar(avatarUrl: userProfile.avatar),

                                const SizedBox(height: 12),

                                Text(
                                  userProfile.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(15, 22, 35, 1),
                                  ),
                                ),
                        
                                const SizedBox(height: 4),

                                Text(
                                  userProfile.email,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(15, 22, 35, 0.6),
                                  ),
                                ),
                              ],
                            );
                         }
                        },
                      ),

                      

                      const SizedBox(height: 20),

                      const Divider(
                        thickness: 1,
                        color: Color.fromRGBO(15, 22, 35, 0.1),
                      ),

                      const SizedBox(height: 12),

                      ActionListTile(
                        icon: Icons.person_outline,
                        title: 'Profile',
                        onTap: () {},
                      ),
                      ActionListTile(
                        icon: Icons.check_circle_outline,
                        title: 'Saved Locations',
                        onTap: () {},
                      ),
                      ActionListTile(
                        icon: Icons.question_mark_outlined,
                        title: 'FAQ',
                        onTap: () {},
                      ),

                      const SizedBox(height: 2),

                      const Divider(
                        thickness: 1,
                        color: Color.fromRGBO(15, 22, 35, 0.1),
                      ),

                      const SizedBox(height: 12),

                      ActionListTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      ActionListTile(
                        icon: Icons.info_outline,
                        title: 'About Us',
                        onTap: () {},
                      ),
                      ActionListTile(
                        icon: Icons.phone_outlined,
                        title: 'Contact Us',
                        onTap: () {},
                      ),
                      ActionListTile(
                        icon: Icons.logout_outlined,
                        title: 'Logout',
                        onTap: () {
                          context.read<AuthProvider>().logout();
                          if (context.mounted) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                          }
                        },
                      ),

                      const SizedBox(height: 15),

                      const _AppInfo(),

                      const SizedBox(height: 20),

                    ],
                  ),

                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Avatar extends StatelessWidget {

  final String avatarUrl;

  const _Avatar({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 4,
        ),
      ),

      child: Center(
        child: ClipOval(
          child: SizedBox(
            width: 92,
            height: 92,
            child: Image.network(
              avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _AppInfo extends StatelessWidget {
  const _AppInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 14),

        Image(
          image: AssetImage('assets/images/logo.png'),
          width: 56,
          height: 56,
        ),

        SizedBox(width: 14),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Air AQ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(15, 22, 35, 1),
              ),
            ),

            SizedBox(height: 2),

            Text(
              'Version: V1.1',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(107, 114, 128, 1),
              ),
            ),
          ],
        )
      ],
    );
  }
}