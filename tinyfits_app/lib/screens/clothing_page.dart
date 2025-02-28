import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinyfits_app/screens/add_details_page.dart';
import 'package:tinyfits_app/screens/tops_page.dart';
import 'package:tinyfits_app/screens/pants_page.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:tinyfits_app/screens/clothing_details_page.dart';
import 'package:tinyfits_app/screens/home_page.dart';
import 'package:tinyfits_app/theme/colors.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({super.key});

  void _navigateToTops(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TopsPage()),
    );
  }

  void _navigateToPants(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PantsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemsList = [
      {
        'name': 'Patch Striped Tee',
        'description':
            'Striped T-shirt with a round neckline, short sleeves, and a front terry patch detail.',
        'material': 'Soft cotton blend—easy care.',
        'images': [
          'assets/tops/patch_striped_tee_red.jpg',
          'assets/tops/patch_striped_tee_blue.jpg'
        ],
        'colors': ['Red', 'Blue'],
        'sizes': ['S', 'M', 'L'],
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
        'name': 'Long-Sleeve Round Neck Tee',
        'description':
            'Classic long-sleeve tee with a round neckline for a versatile look.',
        'material': 'Soft, stretchy fabric—easy care.',
        'images': [
          'assets/tops/longsleeve_tround_neck_tee_pink.jpg',
          'assets/tops/longsleeve_tround_neck_tee_black.jpg',
          'assets/tops/longsleeve_tround_neck_tee_white.jpg'
        ],
        'colors': ['Pink', 'Black', 'White'],
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
      //**************************************************************************************************************************** */
      endDrawer: CustomDrawer(
        userName: "John Doe", //HARDCORDED
        userEmail: "johndoe@email.com", // HARDCORDED
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _navigateToTops(context),
                  child: const Column(
                    children: [
                      FaIcon(FontAwesomeIcons.shirt, size: 40),
                      Text('Tops'),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                GestureDetector(
                  onTap: () => _navigateToPants(context),
                  child: const Column(
                    children: [
                      Icon(Icons.straight, size: 40),
                      Text('Pants'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            /// **Spacing Before Grid**
            // const SizedBox(height: 12),

            /// **Expanded GridView**
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85, // Adjusted for better proportions
                ),
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  final item = itemsList[index];

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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checkroom,
            ),
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
              // Already on clothing page
              break;
            case 1:
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddDetailsPage()),
              );
              break;
            case 2:
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildItemCard(String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
