import 'package:flutter/material.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  static const Color maroon = Color.fromARGB(255, 112, 33, 60);

  void showAccount(BuildContext context, String account) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected account: $account')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media'),
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
            const Text(
              'Connect With Me',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap an account to display its username.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Card(
              child: ListTile(
                leading: const Icon(Icons.facebook, color: Colors.blue),
                title: const Text('Facebook'),
                subtitle: const Text('Germaine Joy C. Incinada'),
                trailing: const Icon(Icons.chevron_right, color: maroon),
                onTap: () => showAccount(
                  context,
                  'Facebook: Germaine Joy C. Incinada',
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.pink),
                title: const Text('Instagram'),
                subtitle: const Text('@Eniamreg_yoJ.sample'),
                trailing: const Icon(Icons.chevron_right, color: maroon),
                onTap: () => showAccount(
                  context,
                  'Instagram: @Eniamreg_yoJ.sample',
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.play_circle, color: Colors.red),
                title: const Text('YouTube'),
                subtitle: const Text('@JustAWatchedNotTheWatched(:>)'),
                trailing: const Icon(Icons.chevron_right, color: maroon),
                onTap: () => showAccount(
                  context,
                  'YouTube: @JustAWatchedNotTheWatched(:>)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}