import 'package:flutter/material.dart';
import 'package:tinyfits_app/theme/colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Effective Date Section**
              _buildDateSection(),
              const SizedBox(height: 20),

              /// **Privacy Sections**
              _buildSection(
                '1. Introduction',
                'Welcome to TinyFits! TinyFits is designed to help parents manage children’s clothing sizes.\n\n'
                    'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your data.\n\n'
                    'By using TinyFits, you agree to the collection and use of information in accordance with this policy.',
              ),
              _buildSection(
                '2. Information We Collect',
                'We collect the following information:',
                bulletPoints: [
                  BulletPoint(
                    title: 'Personal Information:',
                    content: 'Your name, email address, and account details.',
                  ),
                  BulletPoint(
                    title: 'Child Profile Information:',
                    content:
                        'Your child’s name, age, height, weight, and gender (for size recommendations).',
                  ),
                  BulletPoint(
                    title: 'App Usage Data:',
                    content:
                        'Interactions within the app, such as selected clothing items or preferences.',
                  ),
                ],
              ),
              _buildSection(
                '3. How We Use Your Information',
                'We use your data to:',
                bulletPoints: [
                  BulletPoint(
                    content:
                        'Generate personalized clothing size recommendations.',
                  ),
                  BulletPoint(
                    content: 'Improve app functionality and user experience.',
                  ),
                  BulletPoint(
                    content: 'Store and manage child profiles securely.',
                  ),
                ],
                additionalContent:
                    '\nWe do not sell or share your personal data with third parties.',
              ),
              _buildSection(
                '4. Data Security',
                'We implement security measures to protect your data:',
                bulletPoints: [
                  BulletPoint(
                    content:
                        'Sensitive data is encrypted to prevent unauthorized access.',
                  ),
                  BulletPoint(
                    content:
                        'We use secure servers and industry-standard security protocols.',
                  ),
                  BulletPoint(
                    content:
                        'Your personal details are not shared with unauthorized parties.',
                  ),
                ],
                additionalContent:
                    '\nWhile we strive to secure your data, no online system is 100% secure.',
              ),
              _buildSection(
                '5. Third-Party Services',
                'TinyFits does not sell or share your personal data.\n\n'
                    'However, we may use third-party analytics services to improve app experience. These services comply with data protection regulations.',
              ),
              _buildSection(
                '6. Your Rights & Data Control',
                'As a TinyFits user, you have the right to:',
                bulletPoints: [
                  BulletPoint(
                    content: 'Access the personal data stored in your account.',
                  ),
                  BulletPoint(
                    content: 'Edit or delete your child’s profile at any time.',
                  ),
                  BulletPoint(
                    content:
                        'Request account deletion by contacting support@tinyfits.com.',
                  ),
                ],
                additionalContent:
                    '\nIf you wish to exercise these rights, please contact us.',
              ),
              _buildSection(
                '7. Changes to This Policy',
                'We may update this Privacy Policy periodically. Changes will be reflected in the app, and we will notify users of significant updates.\n\n'
                    'Please review this policy regularly to stay informed about how we protect your data.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 📌 **Date Section with Modern Styling**
  Widget _buildDateSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoItem(Icons.calendar_today, 'Effective Date: 19-02-2025'),
            _infoItem(Icons.update, 'Last Updated: 19-02-2025'),
          ],
        ),
      ),
    );
  }

  /// 📌 **Reusable Privacy Sections with Cards**
  Widget _buildSection(
    String title,
    String content, {
    List<BulletPoint>? bulletPoints,
    String? additionalContent,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18, // Reduced from 20
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14, // Reduced from 16
                color: Colors.black87,
              ),
            ),
            if (bulletPoints != null) ...[
              const SizedBox(height: 8),
              ...bulletPoints.map((bullet) => _buildBulletPoint(bullet)),
            ],
            if (additionalContent != null) ...[
              const SizedBox(height: 8),
              Text(
                additionalContent,
                style: const TextStyle(
                  fontSize: 14, // Reduced from 16
                  color: Colors.black87,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Bullet Points with Improved Styling
  Widget _buildBulletPoint(BulletPoint bullet) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle,
              size: 6, color: Colors.black54), // Small bullet dot
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                children: [
                  if (bullet.title != null)
                    TextSpan(
                      text: '${bullet.title} ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  TextSpan(text: bullet.content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Reusable Info Item (Date Section)
  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.themeBlue, size: 20),
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

/// Bullet Point Model
class BulletPoint {
  final String? title;
  final String content;

  BulletPoint({this.title, required this.content});
}
