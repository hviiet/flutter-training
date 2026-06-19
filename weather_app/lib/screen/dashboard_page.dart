import 'package:flutter/material.dart';
import 'package:weather_app/blocs/city/city_cubit.dart';
import 'package:weather_app/providers/navigation_provider.dart';
import 'package:weather_app/screen/databank_page.dart';
import 'package:weather_app/screen/home_page.dart';
import 'package:weather_app/screen/more_page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  final pages = [
    HomePage(),
    DatabankPage(),
    MorePage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CityCubit>().loadCity("danang");
    context.read<CityCubit>().loadCity("hanoi");
    context.read<CityCubit>().loadCity("london");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child){
        return Scaffold(
          body: pages[provider.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentPage,
            onTap: provider.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home", 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: "Data Bank", 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: "More", 
              )
            ]
          ),
        );
      },
    );
  }
}