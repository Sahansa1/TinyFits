import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About TinyFits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'TinyFits is your ultimate companion for managing your children\'s clothing sizes and growth.\n\n'
              'Version: 1.0.0\n\n'
              'Features:\n'
              '• Track multiple children\'s measurements\n'
              '• Manage clothing inventory\n'
              '• Get size recommendations\n'
              '• Track growth over time\n\n'
              '© 2024 TinyFits. All rights reserved.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
