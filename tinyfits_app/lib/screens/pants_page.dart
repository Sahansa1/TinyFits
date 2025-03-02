import 'package:flutter/material.dart';
import 'clothing_details_page.dart'; // Import the details page
import 'package:tinyfits_app/screens/custom_drawer.dart';

import 'home_Page.dart';
import 'add_details_page.dart';

import 'clothing_page.dart';

class PantsPage extends StatelessWidget {
  const PantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pantsList = [
      {
        "name": "Denim Leggings",
        "description":
            "Stretchy leggings with an elastic waistband and back patch pockets.",
        "material": "Soft, flexible fabric—machine washable.",
        "images": [
          "assets/pants/denim_legging_blue.jpg",
          "assets/pants/denim_legging_sky.jpg",
          "assets/pants/denim_legging_black.jpg"
        ],
        "colors": ["Blue", "Blue", "Black"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Printed Leggings",
        "description":
            "Stretchy leggings with unique printed designs and an elastic waistband.",
        "material": "Soft, breathable fabric—machine washable.",
        "images": [
          "assets/pants/printed_leggings_2.jpg",
          "assets/pants/printed_leggings_1.jpg",
          "assets/pants/printed_leggings_3.jpg",
          "assets/pants/printed_leggings_4.jpg",
          "assets/pants/printed_leggings_5.jpg"
        ],
        "colors": ["Various Prints"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Culottes",
        "description": "Wide-leg culotte pants with an elastic waistband.",
        "material": "Lightweight and breathable—easy care.",
        "images": [
          "assets/pants/culottes_pink.jpg",
          "assets/pants/culottes_blue.jpg"
        ],
        "colors": ["Pink", "Blue"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Embroidered Shorts",
        "description":
            "Stylish shorts with delicate embroidery and an elastic waistband.",
        "material": "Soft, durable fabric—machine washable.",
        "images": [
          "assets/pants/embroidered_shorts_yellow.jpg",
          "assets/pants/embroidered_shorts_pink.jpg",
          "assets/pants/embroidered_shorts_blue.jpg"
        ],
        "colors": ["Yellow", "Pink", "Blue"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Fleece Straight-Leg Pants",
        "description":
            "Cozy straight-leg pants with an elastic waistband and adjustable drawstring.",
        "material": "Warm fleece blend—easy to wash.",
        "images": [
          "assets/pants/fleece_straight_leg_pants_black.jpg",
          "assets/pants/fleece_straight_leg_pants_brown.jpg"
        ],
        "colors": ["Black", "Brown"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Ribbed Leggings",
        "description":
            "100% cashmere ribbed leggings with an elastic waistband.",
        "material": "Luxuriously soft—dry clean only.",
        "images": [
          "assets/pants/ribbed_legging_pink.jpg",
          "assets/pants/ribbed_legging_sand.jpg"
        ],
        "colors": ["Pink", "Brown"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Striped Piqué Culottes",
        "description":
            "Culotte pants with an elastic waistband and a striped print.",
        "material": "Lightweight fabric—easy care.",
        "images": [
          "assets/pants/striped_culottes_pink.jpg",
          "assets/pants/striped_culottes_white.jpg"
        ],
        "colors": ["Pink", "White"],
        "sizes": ["S", "M", "L"]
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo3.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.black26,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      //**************************************************************************************** */
      endDrawer: CustomDrawer(
        userName: "John Doe", //HARDCORDED
        userEmail: "johndoe@email.com", // HARDCORDED
      ),

//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // 2 items per row
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1, // Adjusted for better proportion
//           ),
//           itemCount: topsList.length,
//           itemBuilder: (context, index) {
//             final item = topsList[index];

//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ClothingDetailsPage(item: item),
//                   ),
//                 );
//               },
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Stack(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         /// **Image**
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12)),
//                             child: Image.asset(
//                               item['image'],
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),

//                         /// **Item Name Centered**
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.purple[50], // Light background
//                             borderRadius: const BorderRadius.vertical(
//                                 bottom: Radius.circular(12)),
//                           ),
//                           child: Center(
//                             child: Text(
//                               item['name'],
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     /// **Favorite Icon on Top Right**
//                     Positioned(
//                       top: 8,
//                       right: 8,
//                       child: IconButton(
//                         icon: const Icon(Icons.favorite_border,
//                             color: Colors.grey),
//                         onPressed: () {
//                           // Handle favorite action
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
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
                  'Pants',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// **Spacing Before Grid**
            const SizedBox(height: 12),

            /// **Expanded GridView**
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85, // Adjusted for better proportions
                ),
                itemCount: pantsList.length,
                itemBuilder: (context, index) {
                  final item = pantsList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClothingDetailsPage(item: item),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// **Image Section**
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.asset(
                                    item['images'][0],
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              /// **Item Name Centered**
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.purple[50], // Light background
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(12)),
                                ),
                                child: Center(
                                  child: Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// **Favorite Icon on Top Right**
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                // Handle favorite action
                              },
                            ),
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
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // This should dynamically change if needed
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ClothingPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddDetailsPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
          }
        },
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
      ),
    );
  }
}
