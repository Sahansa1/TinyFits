import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/screens/add_details_page.dart';
import 'package:tinyfits_app/screens/profile_page.dart';
import 'package:tinyfits_app/screens/clothing_page.dart';
import 'package:tinyfits_app/screens/help_support_page.dart';
import 'package:tinyfits_app/screens/privacy_policy_page.dart';
import 'package:tinyfits_app/screens/about_page.dart';
import 'package:tinyfits_app/screens/edit_details_page.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:tinyfits_app/screens/login.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChildCard> cards = [];
  final List<Color> cardColors = [
    AppColors.themeOrange,
    AppColors.themePurple,
    AppColors.themeGreen,
    AppColors.themeBlue,
    AppColors.themePink,
    AppColors.themePeach,
  ];

  Color getCardColor(int index) {
    return cardColors[index % cardColors.length];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Image.asset(
  //         'assets/logo.png',
  //         height: 40,
  //       ),
  //       backgroundColor: Colors.white,
  //       elevation: 0,
  //       actions: [
  //         Builder(
  //           builder: (context) => IconButton(
  //             icon: const Icon(Icons.menu),
  //             onPressed: () => Scaffold.of(context).openEndDrawer(),
  //           ),
  //         ),
  //       ],
  //     ),
  //     body: Column(
  //       children: [
  //         if (cards.isEmpty)
  //           Expanded(
  //             child: Center(
  //               child: GestureDetector(
  //                 onTap: () => _navigateToAddDetails(),
  //                 child: Container(
  //                   padding: const EdgeInsets.symmetric(
  //                     horizontal: 40,
  //                     vertical: 20,
  //                   ),
  //                   decoration: BoxDecoration(
  //                     color: AppColors.themeBlue,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: const Text(
  //                     'Add a card',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )
  //         else
  //           Expanded(
  //             child: ListView.builder(
  //               padding: const EdgeInsets.all(16),
  //               itemCount: cards.length,
  //               itemBuilder: (context, index) {
  //                 final card = cards[index];
  //                 return GestureDetector(
  //                   onTap: () => _navigateToProfile(card),
  //                   child: Container(
  //                     margin: const EdgeInsets.only(bottom: 16),
  //                     padding: const EdgeInsets.all(16),
  //                     decoration: BoxDecoration(
  //                       color: getCardColor(index),
  //                       borderRadius: BorderRadius.circular(12),
  //                     ),
  //                     child: Row(
  //                       children: [
  //                         CircleAvatar(
  //                           radius: 30,
  //                           backgroundImage: card.imageUrl != null
  //                               ? NetworkImage(card.imageUrl!)
  //                               : null,
  //                           child: card.imageUrl == null
  //                               ? const Icon(Icons.person)
  //                               : null,
  //                         ),
  //                         const SizedBox(width: 16),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               card.name,
  //                               style: const TextStyle(
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             Text(
  //                               'Age: ${_calculateAge(card.dateOfBirth)}',
  //                               style: const TextStyle(
  //                                 color: Color.fromARGB(255, 255, 255, 255),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //       ],
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: 0,
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.checkroom),
  //           label: 'Clothing',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.add),
  //           label: 'Add',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.person),
  //           label: 'Profile',
  //         ),
  //       ],
  //       onTap: (index) {
  //         switch (index) {
  //           case 0:
  //             _navigateToClothing();
  //             break;
  //           case 1:
  //             _navigateToAddDetails();
  //             break;
  //           case 2:
  //             _navigateToHome();
  //             break;
  //         }
  //       },
  //     ),
  //     endDrawer: const CustomDrawer(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          if (cards.isEmpty)
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () => _navigateToAddDetails(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Add a card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return GestureDetector(
                    onTap: () {}, // Add navigation logic if needed
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: getCardColor(index),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          /// **Profile Image / Placeholder**
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: card.imageUrl != null
                                ? NetworkImage(card.imageUrl!)
                                : null,
                            child: card.imageUrl == null
                                ? const Icon(Icons.person, size: 40)
                                : null,
                          ),
                          const SizedBox(width: 16),

                          /// **Name & Age**
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Age: ${_calculateAge(card.dateOfBirth)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// **Buttons (Clothing & Delete)**
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.checkroom,
                                    color: Colors.white),
                                onPressed: _navigateToClothing,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: () => _deleteCard(index),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom),
            label: 'Clothing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              _navigateToClothing();
              break;
            case 1:
              _navigateToAddDetails();
              break;
            case 2:
              _navigateToHome();
              break;
          }
        },
      ),
    );
  }

  void _navigateToAddDetails() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddDetailsPage()),
    );
    if (result != null && result is ChildCard) {
      setState(() {
        cards.add(result);
      });
    }
  }

  void _navigateToProfile(ChildCard card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(card: card),
      ),
    );
  }

  void _navigateToClothing() {
    //print('Navigating to Clothing Page');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClothingPage()),
    );
  }

  void _navigateToHome() {
    if (Navigator.canPop(context)) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  // void _navigateToHelpSupport() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HelpSupportPage()),
  //   );
  // }

  // void _navigateToPrivacyPolicy() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
  //   );
  // }

  // void _navigateToAbout() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const AboutPage()),
  //   );
  // }

  Future<void> _editCard(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDetailsPage(card: cards[index]),
      ),
    );

    // Update the card if we got a result back
    if (result != null && result is ChildCard) {
      setState(() {
        cards[index] = result; // Update the card in the list
      });
    }
  }

  /// **Function to Delete a Card**
  void _deleteCard(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // **Trash Icon on Top**
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.themeBlue, // Light red background
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),

                // **Title**
                const Text(
                  'Delete Card?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // **Description**
                const Text(
                  "This action can't be undone.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // **Buttons**
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cards.removeAt(index);
                          });
                          Navigator.pop(context); // Close dialog
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.themeBlue, // Delete button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Yes, Delete",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.themeBlue, // Cancel button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Function to calculate age in years, months, and days
  String _calculateAge(String dateOfBirth) {
    try {
      // Convert "DD/MM/YYYY" string into DateTime
      DateTime dob = DateFormat("dd/MM/yyyy").parse(dateOfBirth);
      DateTime today = DateTime.now();

      int years = today.year - dob.year;
      int months = today.month - dob.month;
      int days = today.day - dob.day;

      // Adjust if the birth date has not yet occurred this year
      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += (months < 0) ? 12 : 0;
      }

      // Adjust days if needed
      if (days < 0) {
        DateTime lastMonth = DateTime(today.year, today.month - 1, dob.day);
        days = today.difference(lastMonth).inDays;
        months--;
      }

      return "$years years, $months months, $days days";
    } catch (e) {
      return "Invalid date"; // Handle errors gracefully
    }
  }
}
