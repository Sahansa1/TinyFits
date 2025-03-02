import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinyfits_app/screens/child_tops.dart';
import 'package:tinyfits_app/screens/child_pants.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:tinyfits_app/screens/profile_page.dart';
import 'package:tinyfits_app/screens/clothing_page.dart';
import 'package:tinyfits_app/screens/home_page.dart';
import 'package:tinyfits_app/models/child_card.dart';

import 'package:tinyfits_app/screens/child_clothing_details_page.dart';

class ChildClothingPage extends StatelessWidget {
  final ChildCard child;

  const ChildClothingPage({super.key, required this.child});

  void _navigateToChildTops(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChildTopsPage(child: child),
      ),
    );
  }

  void _navigateToChildPants(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChildPantsPage(child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemsList = [
      {
        "name": "Balloon Skirt",
        "description":
            "Balloon skirt with an elastic waistband. Bow appliqué detail on the front.",
        "material": "Soft cotton blend—comfortable and stylish.",
        "images": [
          "assets/other/balloon_skirt.jpg",
          "assets/other/balloon_skirt_purple.jpg"
        ],
        "colors": ["Orange", "Purple"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Crotchet Dress",
        "description":
            "Sleeveless round neck dress with crochet flower detail.",
        "material": "Polyester—lightweight and breathable.",
        "images": ["assets/other/dress_1.jpg"],
        "colors": ["Blue"],
        "sizes": ["S", "M", "L"]
      },
      {
        "name": "Denim Jacket",
        "description":
            "Jacket with a shirt collar and long sleeves. Front snap-button closure with embroidered details.",
        "material": "Denim—durable and stylish.",
        "images": ["assets/other/denim_jacket.jpg"],
        "colors": ["Blue"],
        "sizes": ["S", "M", "L"]
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

      /// **App Bar**
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

      /// **Side Drawer**
      endDrawer: CustomDrawer(
        userName: child.name,
        userEmail: "User Email Here",
      ),

      /// **Body Content**
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Featured**
            _buildSectionTitle('Featured Categories'),
            _buildCategoryChips([
              'Recently Added ',
              'Bestsellers ',
              'Limited Edition',
              'Trending',
            ]),

            const SizedBox(height: 20),

            /// **Featured**
            _buildSectionTitle('Clothing Collections'),
            _buildCategoryChips([
              'Everyday Comfort',
              'Matching Sets',
              'Festive & Special Occasion',
              'Playtime Ready',
              'Character & Themed',
              'Growth-Friendly Picks',
            ]),

            const SizedBox(height: 20),

            /// **Categories Section**
            _buildSectionTitle('Categories'),
            _buildCompactCategoryGrid(context),

            const SizedBox(height: 20),

            /// **Items Section**
            /// **Items Section**
            _buildSectionTitle('All Items'),

            /// **Scrollable Grid of Items (Fixed Height)**
            Container(
              height:
                  MediaQuery.of(context).size.height * 0.6, // Adjust as needed
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 2 items per row
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
                          builder: (context) => ChildClothingDetailsPage(
                              child: child, item: item),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // _buildItemsGrid(context),
          ],
        ),
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.checkroom),
            label: 'Clothing',
          ),

          /// **Child Profile Image or Initial**
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(card: child),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[300],
                backgroundImage: child.imageUrl != null
                    ? NetworkImage(child.imageUrl!)
                    : null,
                child: child.imageUrl == null
                    ? Text(
                        child.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
            label: child.name,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ClothingPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(card: child),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      ),
    );
  }

  /// **Reusable Section Title**
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // **Compact Categories Grid with Navigation for Tops & Pants**
  Widget _buildCompactCategoryGrid(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': FontAwesomeIcons.shirt, 'title': 'Tops', 'navigate': true},
      {'icon': FontAwesomeIcons.userTie, 'title': 'Pants', 'navigate': true},
      {'icon': FontAwesomeIcons.userTie, 'title': 'Dresses', 'navigate': false},
      {'icon': FontAwesomeIcons.userTie, 'title': 'Skirts', 'navigate': true},
      {'icon': FontAwesomeIcons.shirt, 'title': 'Suits', 'navigate': false},
      {'icon': FontAwesomeIcons.userTie, 'title': 'Jackets', 'navigate': false},
    ];

    return SizedBox(
      height: 80, // Compact row height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              if (category['navigate'] == true) {
                if (category['title'] == 'Tops') {
                  _navigateToChildTops(context);
                } else if (category['title'] == 'Pants') {
                  _navigateToChildPants(context);
                }
              }
            },
            child: _buildSmallCategoryCard(category['icon'], category['title']),
          );
        },
      ),
    );
  }

  /// **Small Category Card with Smaller Icons**
  Widget _buildSmallCategoryCard(IconData icon, String title) {
    return Container(
      width: 75, // Reduced width for more compact layout
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: Colors.black54), // 🔹 Smaller icon size
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  /// **Scrollable Category Chips**
  Widget _buildCategoryChips(List<String> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              label: Text(category),
              backgroundColor: Colors.grey[200],
            ),
          );
        }).toList(),
      ),
    );
  }
}
