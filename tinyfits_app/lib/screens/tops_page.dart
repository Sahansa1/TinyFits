import 'package:flutter/material.dart';
import 'clothing_details_page.dart'; // Import the details page

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
        'image': 'assets/tops/sleeveless_tee_yellow.jpg',
        'colors': ['Yellow', 'Blue'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Plain Tee',
        'description':
            'Simple short-sleeve tee with a round neckline for everyday wear.',
        'material': 'Lightweight and breathable—machine washable.',
        'image': 'assets/tops/plain_tee_purple.jpg',
        'colors': ['Purple', 'Pink', 'White'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Printed Tee',
        'description':
            'Stylish printed tee with a comfortable fit and a round neckline.',
        'material': 'Soft cotton fabric—easy care.',
        'image': 'assets/tops/printed_tee.jpg',
        'colors': ['Various prints available'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Knit Cardigan',
        'description':
            'Cozy knit cardigan with a soft texture and a relaxed fit.',
        'material': 'Warm and breathable—machine washable.',
        'image': 'assets/tops/knitcardigan.jpg',
        'colors': [],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Round Neck Tee',
        'description':
            'Classic long-sleeve tee with a round neckline for a versatile look.',
        'material': 'Soft, stretchy fabric—easy care.',
        'image': 'assets/tops/longsleeve_tround_neck_tee_pink.jpg',
        'colors': ['White', 'Black', 'Pink'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Striped Tee',
        'description': 'Timeless striped long-sleeve tee with a relaxed fit.',
        'material': 'Lightweight and breathable—machine washable.',
        'image': 'assets/tops/lsleeve_striped_blue.jpg',
        'colors': ['Blue', 'Brown'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Openwork Knit Top',
        'description':
            'Sleeveless open-knit top with a round neckline and scalloped trim.',
        'material': 'Delicate knit—hand wash recommended.',
        'image': 'assets/tops/openwork_knit_top.jpg',
        'colors': [],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Patch Striped Tee',
        'description':
            'Striped T-shirt with a round neckline, short sleeves, and a front terry patch detail.',
        'material': 'Soft cotton blend—easy care.',
        'image': 'assets/tops/patch_striped_tee_red.jpg',
        'colors': ['Blue', 'Red'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Striped Knit Sweatshirt',
        'description':
            'Knit sweater with a round neckline, long sleeves, and a tubular hem. Features a multicolor striped print.',
        'material': 'Cozy knit—gentle wash recommended.',
        'image': 'assets/tops/striped_knit_sweatshirt_pink.jpg',
        'colors': ['Pink', 'Brown'],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Thermal Shirt',
        'description':
            'Warm thermal shirt designed for insulation and comfort.',
        'material': 'Heat-retaining fabric—machine washable.',
        'image': 'assets/tops/thermal_shirt_green.jpg',
        'colors': ['Green', 'Orange'],
        'sizes': ['S', 'M', 'L'],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tops'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1, // Adjusted for better proportion
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
                        /// **Image**
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.asset(
                              item['image'],
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
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.grey),
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
    );
  }
}
