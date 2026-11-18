import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color maroon = Color.fromARGB(255, 112, 33, 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: maroon,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1,
          vertical: MediaQuery.sizeOf(context).height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.home, size: 80, color: maroon),
            const SizedBox(height: 16),
            const Text(
              'Welcome, Student!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Use the navigation bar below to explore the app.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.calculate, color: maroon),
                    title: Text('Calculator'),
                    subtitle: Text('Perform basic arithmetic operations.'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.person, color: maroon),
                    title: Text('Profile'),
                    subtitle: Text('View your student information.'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.share, color: maroon),
                    title: Text('Social Media'),
                    subtitle: Text('View your sample social accounts.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}