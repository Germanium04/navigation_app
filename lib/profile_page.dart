import 'package:flutter/material.dart';
import 'demo_auth.dart';
import 'login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color maroon = Color.fromARGB(255, 112, 33, 60);

  Future<void> confirmLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            style: TextButton.styleFrom(foregroundColor: maroon),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: maroon),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && context.mounted) {
      DemoAuth.logout();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () => confirmLogout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1,
          vertical: MediaQuery.sizeOf(context).height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: maroon,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Germaine Joy C. Incinada',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.badge, color: maroon),
                    title: Text('Student ID'),
                    subtitle: Text('S558924'),
                  ),
                  ListTile(
                    leading: Icon(Icons.school, color: maroon),
                    title: Text('Course and Section'),
                    subtitle: Text('BSIT — 3450'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: maroon),
                    title: Text('Email'),
                    subtitle: Text('g.incinada.558924@umindanao.edu.ph'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            OutlinedButton.icon(
              onPressed: () => confirmLogout(context),
              icon: const Icon(Icons.logout, color: maroon),
              label: const Text(
                'Logout',
                style: TextStyle(fontSize: 17, color: maroon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}