import 'package:flutter/material.dart';
import 'package:tinyfits_app/theme/colors.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeBlue,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Find answers to commonly asked questions below',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              const ContactSection(),
              const SizedBox(height: 24),
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...faqItems.map((faq) => FAQCard(
                    question: faq.question,
                    answer: faq.answer,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.email_outlined,
            color: AppColors.themeBlue,
            size: 32,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact Support',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'support@tinyfits.com',
                style: TextStyle(
                  color: AppColors.themeBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.answer,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

final List<FAQ> faqItems = [
  FAQ(
    question: 'How do I add a child profile?',
    answer:
        'To add a child profile, click the "Add a card" button on the home page. Enter your child\'s details such as name, date of birth, height, weight, and gender. Once the details are filled, click "Save" to create the profile.',
  ),
  FAQ(
    question: 'How do I get size recommendations for my child?',
    answer:
        'After adding a child profile, click on the "Clothing" icon on the card of the selected child. This will take you to the clothing section where personalized size recommendations will be displayed based on your child\'s measurements.',
  ),
  FAQ(
    question: 'Can I add multiple children?',
    answer:
        'Yes! You can add as many child profiles as you want. Simply click "Add a card" on the home page and enter the details for each child. Each child will have their own clothing size recommendations.',
  ),
  FAQ(
    question: 'What if my child is between two sizes?',
    answer:
        'If your child is between two sizes, the app will recommend the best fit based on their current measurements. You can also manually adjust the size by selecting the "Manual Size Selection" option.',
  ),
  FAQ(
    question: 'How do I change my child\'s profile information?',
    answer:
        'You can easily edit any child\'s profile. Simply click on the child\'s card, make the necessary changes (e.g., height, weight, etc.), and save the updated information.',
  ),
  FAQ(
    question: 'Can I view clothing items for multiple children at once?',
    answer:
        'No, the clothing catalog is personalized to each child. You need to select a child\'s profile first to view clothing items and size recommendations for them.',
  ),
  FAQ(
    question: 'How does the size recommendation work?',
    answer:
        'Size recommendations are based on your child\'s age, height, weight, and other measurements. The app calculates the best size for your child and provides you with a recommendation for each clothing item.',
  ),
  FAQ(
    question: 'Can I remove or delete a child profile?',
    answer:
        'Yes, you can delete a child profile by going into the profile page and selecting the option to delete or remove the profile. Note that this action cannot be undone.',
  ),
];
