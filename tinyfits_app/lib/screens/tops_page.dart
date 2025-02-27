import 'package:flutter/material.dart';
import 'clothing_details_page.dart'; // Import the details page
import 'package:tinyfits_app/screens/custom_drawer.dart';

class TopsPage extends StatelessWidget {
  const TopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topsList = [
      {
        'name': 'Sleeveless Tee',
        'description':
            'Classic sleeveless tee with a relaxed fit for warm-weather comfort.',
        'material': 'Breathable fabric—machine washable.',
        'images': [
          'assets/tops/sleeveless_tee_yellow.jpg',
          'assets/tops/sleeveless_tee_blue.jpg'
        ],
        'colors': ['Yellow', 'Blue'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Plain Tee',
        'description':
            'Simple short-sleeve tee with a round neckline for everyday wear.',
        'material': 'Lightweight and breathable—machine washable.',
        'images': [
          'assets/tops/plain_tee_purple.jpg',
          'assets/tops/plain_tee_pink.jpg',
          'assets/tops/plain_tee_white.jpg'
        ],
        'colors': ['Purple', 'Pink', 'White'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Printed Tee',
        'description':
            'Stylish printed tee with a comfortable fit and a round neckline.',
        'material': 'Soft cotton fabric—easy care.',
        'images': ['assets/tops/printed_tee.jpg'],
        'colors': ['Various prints available'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Striped Knit Sweatshirt',
        'description':
            'Knit sweater with a round neckline, long sleeves, and a tubular hem. Features a multicolor striped print.',
        'material': 'Cozy knit—gentle wash recommended.',
        'images': [
          'assets/tops/striped_knit_sweatshirt_pink.jpg',
          'assets/tops/striped_knit_sweatshirt_brown.jpg'
        ],
        'colors': ['Pink', 'Brown'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Round Neck Tee',
        'description':
            'Classic long-sleeve tee with a round neckline for a versatile look.',
        'material': 'Soft, stretchy fabric—easy care.',
        'images': [
          'assets/tops/longsleeve_tround_neck_tee_pink.jpg',
          'assets/tops/longsleeve_tround_neck_tee_black.jpg',
          'assets/tops/longsleeve_tround_neck_tee_white.jpg'
        ],
        'colors': ['White', 'Black', 'Pink'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Striped Tee',
        'description': 'Timeless striped long-sleeve tee with a relaxed fit.',
        'material': 'Lightweight and breathable—machine washable.',
        'images': [
          'assets/tops/lsleeve_striped_blue.jpg',
          'assets/tops/lsleeve_striped_brown.jpg'
        ],
        'colors': ['Blue', 'Brown'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Openwork Knit Top',
        'description':
            'Sleeveless open-knit top with a round neckline and scalloped trim.',
        'material': 'Delicate knit—hand wash recommended.',
        'images': ['assets/tops/openwork_knit_top.jpg'],
        'colors': [],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Patch Striped Tee',
        'description':
            'Striped T-shirt with a round neckline, short sleeves, and a front terry patch detail.',
        'material': 'Soft cotton blend—easy care.',
        'images': [
          'assets/tops/patch_striped_tee_red.jpg',
          'assets/tops/patch_striped_tee_blue.jpg'
        ],
        'colors': ['Blue', 'Red'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Knit Cardigan',
        'description':
            'Cozy knit cardigan with a soft texture and a relaxed fit.',
        'material': 'Warm and breathable—machine washable.',
        'images': ['assets/tops/knitcardigan.jpg'],
        'colors': [],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Thermal Shirt',
        'description':
            'Warm thermal shirt designed for insulation and comfort.',
        'material': 'Heat-retaining fabric—machine washable.',
        'images': [
          'assets/tops/thermal_shirt_green.jpg',
          'assets/tops/thermal_shirt_orange.jpg'
        ],
        'colors': ['Green', 'Orange'],
        'sizes': ['S', 'M', 'L'],
      },
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
                  'Tops',
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
                itemCount: topsList.length,
                itemBuilder: (context, index) {
                  final item = topsList[index];

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
    );
  }
}
