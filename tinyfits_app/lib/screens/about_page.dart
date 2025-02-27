import 'package:flutter/material.dart';
import 'package:tinyfits_app/theme/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16), // Adjust spacing if needed
                child: Image.asset(
                  'assets/logo.png',
                  height: 80, // Set appropriate size
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This app was developed as a final-year project to help parents predict child growth and recommend clothing sizes for kids aged 1 to 5 years based on key measurements. Designed specifically for Sri Lankan children, it considers unique growth patterns different from other countries. In the future, we aim to expand to other countries and integrate the app with real clothing stores.',
              style: TextStyle(
                fontSize: 14, // Reduced for better readability
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            /// Features Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _featureItem(Icons.child_care,
                        'Track multiple children\'s measurements'),
                    _featureItem(Icons.inventory, 'Manage clothing inventory'),
                    _featureItem(Icons.recommend, 'Get size recommendations'),
                    _featureItem(Icons.timeline, 'Track growth over time'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Version & Copyright Info
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoItem(Icons.info_outline, 'Version: 1.0.0'),
                    _infoItem(Icons.copyright,
                        '© 2024 TinyFits. All rights reserved.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Feature Item UI
  Widget _featureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.themeBlue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable Info Item UI
  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700, size: 20),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
