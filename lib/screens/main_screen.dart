import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:air_quality/providers/navigation_provider.dart';
import 'package:air_quality/screens/home_screen.dart';
import 'package:air_quality/screens/data_bank_screen.dart';
import 'package:air_quality/screens/more_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Danh sách các màn hình tương ứng với các tab
  final List<Widget> _screens = const [
    HomeScreen(),
    DataBankScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Dùng Consumer để lắng nghe thay đổi từ NavigationProvider
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: IndexedStack(
            index: navigationProvider.currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) {
              // Khi người dùng nhấn vào một tab, gọi phương thức setIndex
              // của provider để cập nhật trạng thái.
              // `listen: false` được dùng ở đây vì chúng ta chỉ gọi phương thức
              // chứ không cần build lại widget này.
              Provider.of<NavigationProvider>(context, listen: false)
                  .setIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud_download_outlined),
                activeIcon: Icon(Icons.cloud_download),
                label: 'Data Bank',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                activeIcon: Icon(Icons.more_horiz),
                label: 'More',
              ),
            ],
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}