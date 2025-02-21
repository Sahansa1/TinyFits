import 'package:flutter/material.dart';

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
              const SizedBox(height: 8),
              _buildDateSection(),
              const SizedBox(height: 24),
              _buildSection(
                '1. Introduction',
                'Welcome to TinyFits! TinyFits is a mobile application designed to help parents '
                    'find the right clothing sizes for their children based on personalized recommendations.\n\n'
                    'Your privacy is important to us, and this Privacy Policy explains how we collect, '
                    'use, and protect your data.\n\n'
                    'By using TinyFits, you agree to the collection and use of information in accordance with this policy.',
              ),
              _buildSection(
                '2. Information We Collect',
                'We collect the following types of information to provide and improve our services:',
                bulletPoints: [
                  BulletPoint(
                    title: 'Personal Information:',
                    content: 'Your name, email address, and account details.',
                  ),
                  BulletPoint(
                    title: 'Child Profile Information:',
                    content:
                        'Your child\'s name, age, height, weight, and gender (for personalized size recommendations).',
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
                'We use your data for the following purposes:',
                bulletPoints: [
                  BulletPoint(
                    content:
                        'To generate personalized clothing size recommendations.',
                  ),
                  BulletPoint(
                    content:
                        'To improve app functionality and user experience.',
                  ),
                  BulletPoint(
                    content: 'To store and manage child profiles.',
                  ),
                ],
                additionalContent:
                    '\nWe do not sell or share your personal data with third parties.',
              ),
              _buildSection(
                '4. Data Security',
                'We take data security seriously and implement appropriate security measures to protect your information.',
                bulletPoints: [
                  BulletPoint(
                    content:
                        'All sensitive data is encrypted to prevent unauthorized access.',
                  ),
                  BulletPoint(
                    content:
                        'We use secure servers and industry-standard security protocols to safeguard your information.',
                  ),
                  BulletPoint(
                    content:
                        'We do not share your personal details with unauthorized parties.',
                  ),
                ],
                additionalContent:
                    '\nHowever, while we strive to use commercially acceptable means to protect your data, '
                    'no method of transmission over the Internet or method of electronic storage is 100% secure.',
              ),
              _buildSection(
                '5. Third-Party Services',
                'TinyFits does not sell or share your personal data with third parties.\n\n'
                    'However, we may use third-party analytics services to improve the app experience, '
                    'such as tracking app usage patterns. These third-party services are required to comply '
                    'with data protection regulations.',
              ),
              _buildSection(
                '6. Your Rights & Data Control',
                'As a TinyFits user, you have the right to:',
                bulletPoints: [
                  BulletPoint(
                    content: 'Access the personal data stored in your account.',
                  ),
                  BulletPoint(
                    content:
                        'Edit or delete your child\'s profile at any time.',
                  ),
                  BulletPoint(
                    content:
                        'Request account deletion by contacting support@tinyfits.com.',
                  ),
                ],
                additionalContent:
                    '\nIf you wish to exercise any of these rights, please contact us.',
              ),
              _buildSection(
                '7. Changes to This Policy',
                'We may update this Privacy Policy from time to time. Any changes will be reflected '
                    'within the app, and we will notify users of significant updates.\n\n'
                    'Please review this policy periodically to stay informed about how we protect your data.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Effective Date: 19-02-2025',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            'Last Updated: 19-02-2025',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    String content, {
    List<BulletPoint>? bulletPoints,
    String? additionalContent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          if (bulletPoints != null) ...[
            const SizedBox(height: 8),
            ...bulletPoints.map((bullet) => _buildBulletPoint(bullet)),
          ],
          if (additionalContent != null) ...[
            Text(
              additionalContent,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBulletPoint(BulletPoint bullet) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black87),
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
}

class BulletPoint {
  final String? title;
  final String content;

  BulletPoint({this.title, required this.content});
}
