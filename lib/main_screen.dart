import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_screen.dart';
import 'profile_page.dart';
import 'social_media_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const Color maroon = Color.fromARGB(255, 112, 33, 60);

  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CalculatorScreen(),
    ProfilePage(),
    SocialMediaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        indicatorColor: const Color.fromARGB(41, 112, 33, 61),
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: maroon),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate, color: maroon),
            label: 'Calculator',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: maroon),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.share_outlined),
            selectedIcon: Icon(Icons.share, color: maroon),
            label: 'Social Media',
          ),
        ],
      ),
    );
  }
}