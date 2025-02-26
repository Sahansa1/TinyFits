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
        'colors': [
          {
            'name': 'Pink',
            'hex': Colors.pink,
            'images': ['assets/tops/knitcardigan.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Round Neck Tee',
        'description':
            'Classic long-sleeve tee with a round neckline for a versatile look.',
        'material': 'Soft, stretchy fabric—easy care.',
        'colors': [
          {
            'name': 'Pink',
            'hex': Colors.pink,
            'images': ['assets/tops/longsleeve_tround_neck_tee_pink.jpg'],
          },
          {
            'name': 'Black',
            'hex': Colors.black,
            'images': ['assets/tops/longsleeve_tround_neck_tee_black.jpg'],
          },
          {
            'name': 'White',
            'hex': Colors.white,
            'images': ['assets/tops/longsleeve_tround_neck_tee_white.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Long-Sleeve Striped Tee',
        'description': 'Timeless striped long-sleeve tee with a relaxed fit.',
        'material': 'Lightweight and breathable—machine washable.',
        'colors': [
          {
            'name': 'Blue',
            'hex': Colors.blue,
            'images': ['assets/tops/lsleeve_striped_blue.jpg'],
          },
          {
            'name': 'Brown',
            'hex': Colors.brown,
            'images': ['assets/tops/lsleeve_striped_brown.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Openwork Knit Top',
        'description':
            'Sleeveless open-knit top with a round neckline and scalloped trim.',
        'material': 'Delicate knit—hand wash recommended.',
        'colors': [
          {
            'name': 'Beige',
            'hex': Colors.brown[200],
            'images': ['assets/tops/openwork_knit_top.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Patch Striped Tee',
        'description':
            'Striped T-shirt with a round neckline, short sleeves, and a front terry patch detail.',
        'material': 'Soft cotton blend—easy care.',
        'colors': [
          {
            'name': 'Red',
            'hex': Colors.red,
            'images': ['assets/tops/patch_striped_tee_red.jpg'],
          },
          {
            'name': 'Blue',
            'hex': Colors.blue,
            'images': ['assets/tops/patch_striped_tee_blue.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Plain Tee',
        'description':
            'Simple short-sleeve tee with a round neckline for everyday wear.',
        'material': 'Lightweight and breathable—machine washable.',
        'colors': [
          {
            'name': 'Purple',
            'hex': Colors.purple,
            'images': ['assets/tops/plain_tee_purple.jpg'],
          },
          {
            'name': 'Pink',
            'hex': Colors.pink,
            'images': ['assets/tops/plain_tee_pink.jpg'],
          },
          {
            'name': 'White',
            'hex': Colors.white,
            'images': ['assets/tops/plain_tee_white.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Printed Tee',
        'description':
            'Stylish printed tee with a comfortable fit and a round neckline.',
        'material': 'Soft cotton fabric—easy care.',
        'colors': [
          {
            'name': 'Multi-Color Prints',
            'hex': Colors.grey,
            'images': ['assets/tops/printed_tee.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Sleeveless Tee',
        'description':
            'Classic sleeveless tee with a relaxed fit for warm-weather comfort.',
        'material': 'Breathable fabric—machine washable.',
        'colors': [
          {
            'name': 'Yellow',
            'hex': Colors.yellow,
            'images': ['assets/tops/sleeveless_tee_yellow.jpg'],
          },
          {
            'name': 'Blue',
            'hex': Colors.blue,
            'images': ['assets/tops/sleeveless_tee_blue.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Striped Knit Sweatshirt',
        'description':
            'Knit sweater with a round neckline, long sleeves, and a tubular hem.',
        'material': 'Cozy knit—gentle wash recommended.',
        'colors': [
          {
            'name': 'Pink',
            'hex': Colors.pink,
            'images': ['assets/tops/striped_knit_sweatshirt_pink.jpg'],
          },
          {
            'name': 'Brown',
            'hex': Colors.brown,
            'images': ['assets/tops/striped_knit_sweatshirt_brown.jpg'],
          }
        ],
        'sizes': ['S', 'M', 'L'],
      },
      {
        'name': 'Thermal Shirt',
        'description':
            'Warm thermal shirt designed for insulation and comfort.',
        'material': 'Heat-retaining fabric—machine washable.',
        'colors': [
          {
            'name': 'Green',
            'hex': Colors.green,
            'images': ['assets/tops/thermal_shirt_green.jpg'],
          },
          {
            'name': 'Orange',
            'hex': Colors.orange,
            'images': ['assets/tops/thermal_shirt_orange.jpg'],
          }
        ],
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
                          item['colors'][0]['images'][0],
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
