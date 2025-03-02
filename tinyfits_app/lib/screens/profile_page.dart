// import 'package:flutter/material.dart';
// import 'package:tinyfits_app/models/child_card.dart';
// import 'package:tinyfits_app/screens/edit_details_page.dart';
// import 'package:tinyfits_app/theme/colors.dart';

// class ProfilePage extends StatelessWidget {
//   final ChildCard card;

//   const ProfilePage({super.key, required this.card});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.orange[100],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: card.imageUrl != null
//                       ? NetworkImage(card.imageUrl!)
//                       : null,
//                   child:
//                       card.imageUrl == null ? const Icon(Icons.person) : null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildInfoRow('Name', card.name),
//               _buildInfoRow('Date of Birth', card.dateOfBirth),
//               _buildInfoRow('Gender', card.gender),
//               _buildInfoRow('Height', card.height),
//               _buildInfoRow('Weight', card.weight),
//               if (card.note != null && card.note!.isNotEmpty)
//                 _buildInfoRow('Note', card.note!),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.themeBlue,
//                       ),
//                       child: const Text('Clothing'),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   ElevatedButton(
//                     onPressed: () => _navigateToEdit(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.themeBlue,
//                     ),
//                     child: const Text('Edit'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _navigateToEdit(BuildContext context) async {
//     final result = await Navigator.push<ChildCard>(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditDetailsPage(card: card),
//       ),
//     );

//     if (result != null) {
//       // Refresh the profile page with the updated data
//       Navigator.pop(context, result);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/screens/edit_details_page.dart';
import 'package:tinyfits_app/screens/past_measurements_page.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinyfits_app/screens/child_clothing_page.dart';

class ProfilePage extends StatelessWidget {
  final ChildCard card;

  const ProfilePage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo3.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      // **************************************************************************************** */
      endDrawer: CustomDrawer(
        userName: "John Doe", //HARDCORDED
        userEmail: "johndoe@email.com", // HARDCORDED
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Header Section with "Tops" Title**
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // body: SingleChildScrollView(
            //   padding: const EdgeInsets.all(16),
            //   child: Column(
            //     children: [
            //       /// **Profile Card**
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.themeOrange,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[200], // Light background for contrast
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey[300]!), // Subtle border
                          ),
                          child: card.imageUrl != null
                              ? ClipOval(
                                  child: Image.network(
                                    card.imageUrl!,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                        ),

                        /// **Edit Icon for Profile Picture**
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: GestureDetector(
                            //  onTap: _pickImage,
                            // TODO: Implement Image Picker

                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .white, // White background for contrast
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColors.themeBlue,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// **User Name**
                  Text(
                    card.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// **Age Display**
                  Text(
                    "Age: ${_calculateAge(card.dateOfBirth)}",
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),

                  const SizedBox(height: 16),

                  /// **User Info Fields**
                  _buildInfoRow("Date of Birth", card.dateOfBirth),
                  _buildInfoRow("Gender", card.gender),
                  // _buildInfoRow("Height", "${card.height} cm"),
                  // _buildInfoRow("Weight", "${card.weight} kg"),
                  if (card.note != null && card.note!.isNotEmpty)
                    _buildInfoRow("Note", card.note!),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// **Action Buttons**
            Row(
              children: [
                /// **Clothing Button**
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChildClothingPage(
                            child: card, // pass child data
                          ),
                        ),
                      );
                      //                    Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //  builder: (context) => ChildClothingDetailsPage(
                      //       // item: selectedItem,  // The selected clothing item
                      //       // child: selectedChild, // The specific child profile
                      //     ),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.checkroom, color: Colors.white),
                    label: const Text("Clothing",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),

                /// **Edit Button**
                ElevatedButton.icon(
                  onPressed: () => _navigateToEdit(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeBlue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label:
                      const Text("Edit", style: TextStyle(color: Colors.white)),
                ),

                const SizedBox(width: 12),

                /// Delete Button
                ElevatedButton.icon(
                  onPressed: () => _cardGetsDeleted(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeBlue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text("Delete",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Center(
              /// **View Past Measurements Button**
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PastMeasurementsPage(
                        pastMeasurements: card.pastMeasurements,
                        dateOfBirth: card.dateOfBirth,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.history, color: Colors.white),
                label: const Text(" View Past Measurements ",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _pickImage() async {
  //   try {
  //     final XFile? pickedFile =
  //         await _picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       setState(() {
  //         _image = File(pickedFile.path);
  //       });
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to pick image')),
  //     );
  //   }
  // }

  /// **User Info Row**
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  /// **Navigate to Edit Page**
  void _navigateToEdit(BuildContext context) async {
    final result = await Navigator.push<ChildCard>(
      context,
      MaterialPageRoute(
        builder: (context) => EditDetailsPage(card: card),
      ),
    );

    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  /// **Calculate Age**
  String _calculateAge(String dateOfBirth) {
    try {
      DateTime dob = DateTime.parse(dateOfBirth);
      DateTime today = DateTime.now();

      int years = today.year - dob.year;
      int months = today.month - dob.month;
      int days = today.day - dob.day;

      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += 12;
      }
      if (days < 0) {
        DateTime lastMonth = DateTime(today.year, today.month - 1, dob.day);
        days = today.difference(lastMonth).inDays;
        months--;
      }

      return "$years years, $months months, $days days";
    } catch (e) {
      return "Invalid date";
    }
  }
}

void _cardGetsDeleted(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded edges
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// **Trash Icon on Top**
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.themeBlue, // Themed background
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),

              /// **Title**
              const Text(
                'Delete Card?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              /// **Warning Message**
              const Text(
                "This action cannot be undone.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              /// **Buttons Row**
              Row(
                children: [
                  /// **Confirm Delete**
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pop(context, true); // Return true on delete
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeBlue,
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

                  /// **Cancel Button**
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 14, color: Colors.black),
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
