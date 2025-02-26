import 'package:flutter/material.dart';
import 'clothing_details_page.dart'; // Import the details page

class TopsPage extends StatelessWidget {
  const TopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topsList = [
      {
        'name': 'Knit Cardigan',
        'description':
            'Cozy knit cardigan with a soft texture and a relaxed fit.',
        'material': 'Warm and breathable—machine washable.',
        'image': 'assets/tops/knitcardigan.jpg',
        'colors': [],
        'sizes': ['S', 'M', 'L']
      },
      {
        'name': 'Long-Sleeve Round Neck Tee',
        'description':
            'Classic long-sleeve tee with a round neckline for a versatile look.',
        'material': 'Soft, stretchy fabric—easy care.',
        'image': 'assets/tops/longsleeve_tround_neck_tee_pink.jpg',
        'colors': ['Pink', 'Black', 'White'],
        'sizes': ['S', 'M', 'L']
      },
      {
        'name': 'Long-Sleeve Striped Tee',
        'description': 'Timeless striped long-sleeve tee with a relaxed fit.',
        'material': 'Lightweight and breathable—machine washable.',
        'image': 'assets/tops/lsleeve_striped_blue.jpg',
        'colors': ['Blue', 'Brown'],
        'sizes': ['S', 'M', 'L']
      },
      {
        'name': 'Openwork Knit Top',
        'description':
            'Sleeveless open-knit top with a round neckline and scalloped trim.',
        'material': 'Delicate knit—hand wash recommended.',
        'image': 'assets/tops/openwork_knit_top.jpg',
        'colors': [],
        'sizes': ['S', 'M', 'L']
      },
      {
        'name': 'Patch Striped Tee',
        'description':
            'Striped T-shirt with a round neckline, short sleeves, and a front terry patch detail.',
        'material': 'Soft cotton blend—easy care.',
        'image': 'assets/tops/patch_striped_tee_red.jpg',
        'colors': ['Red', 'Blue'],
        'sizes': ['S', 'M', 'L']
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
            childAspectRatio: 0.75, // Adjusted to match desired aspect ratio
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
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// **Image Container**
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(
                          item['image'],
                          width: double.infinity,
                          fit: BoxFit
                              .cover, // Ensures the image fills the container properly
                        ),
                      ),
                    ),

                    /// **Text Content**
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors
                            .purple[50], // Light background for better contrast
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Prevents overflow issues
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Size: M',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ],
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
