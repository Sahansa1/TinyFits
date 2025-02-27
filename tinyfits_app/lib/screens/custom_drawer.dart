// import 'package:flutter/material.dart';
// import 'package:tinyfits_app/screens/about_page.dart';
// import 'package:tinyfits_app/screens/help_support_page.dart';
// import 'package:tinyfits_app/screens/privacy_policy_page.dart';
// import 'package:tinyfits_app/screens/login.dart';
// import 'package:tinyfits_app/theme/colors.dart';

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: AppColors.themeBlue,
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.help_outline),
//             title: const Text('Help & Support'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HelpSupportPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.privacy_tip_outlined),
//             title: const Text('Privacy Policy'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const PrivacyPolicyPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.info_outline),
//             title: const Text('About'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AboutPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: const Text('Logout'),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               _showLogoutConfirmationDialog(context); // Pass context properly
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _showLogoutConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20), // Rounded corners
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Info Icon on top
//                 CircleAvatar(
//                   radius: 24,
//                   backgroundColor:
//                       AppColors.themeBlue, // Light background for icon
//                   child: Icon(
//                     Icons.info_outline,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Title
//                 const Text(
//                   'Do you want to logout?',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8),

//                 // Description
//                 const Text(
//                   "You'll need to sign in again.",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),

//                 // Buttons
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close dialog
//                           _logout(context); // Pass context to logout
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.themeBlue, // Button color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "Yes, log out",
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close dialog
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.themeBlue, // Lighter color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "No, stay signed in",
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _logout(BuildContext context) {
//     // Implement your logout logic here (e.g., clear user session)
//     // Then navigate to the login screen
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               const Login()), // Replace with your login screen
//       (Route<dynamic> route) => false, // Remove all previous routes
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinyfits_app/screens/about_page.dart';
import 'package:tinyfits_app/screens/help_support_page.dart';
import 'package:tinyfits_app/screens/privacy_policy_page.dart';
import 'package:tinyfits_app/screens/login.dart';
import 'package:tinyfits_app/theme/colors.dart';

class CustomDrawer extends StatefulWidget {
  final String userName;
  final String userEmail;

  const CustomDrawer({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // **Header with Profile & Name Centered**
          Container(
            width: double.infinity,
            height: 225,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.themeBlue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20), // Moves the profile picture down
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? const Icon(Icons.person,
                                size: 50, color: Colors.blueGrey)
                            : null,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt,
                              color: AppColors.themeBlue, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.userEmail,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // **Menu Items**
          _buildDrawerItem(
            icon: Icons.help_outline,
            text: 'Help & Support',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpSupportPage()));
            },
          ),
          _buildDrawerItem(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy Policy',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()));
            },
          ),
          _buildDrawerItem(
            icon: Icons.info_outline,
            text: 'About',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),

          const Spacer(), // Pushes logout button to bottom

          // **Logout Button at Bottom Right**
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: FloatingActionButton(
                backgroundColor: AppColors.themeBlue,
                onPressed: () => _showLogoutConfirmationDialog(context),
                child: const Icon(Icons.logout, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // **Reusable Drawer ListTile**
  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(text, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }

  // **Logout Confirmation Dialog**
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.themeBlue,
                  child: const Icon(Icons.info_outline,
                      color: Colors.white, size: 28),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Do you want to logout?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "You'll need to sign in again.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _logout(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Yes, log out",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "No, stay signed in",
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

  // **Logout Function**
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
      (Route<dynamic> route) => false,
    );
  }
}
