// import 'package:flutter/material.dart';
// import 'package:tinyfits_app/theme/colors.dart';
// import 'package:tinyfits_app/screens/custom_drawer.dart';
// import 'package:tinyfits_app/screens/clothing_page.dart';
// import 'package:tinyfits_app/screens/profile_page.dart';
// import 'package:tinyfits_app/models/child_card.dart';
// import 'package:tinyfits_app/screens/home_page.dart';

// class ChildClothingDetailsPage extends StatefulWidget {
//   final Map<String, dynamic> item;
//   final ChildCard child;

//   const ChildClothingDetailsPage(
//       {super.key, required this.item, required this.child});

//   @override
//   State<ChildClothingDetailsPage> createState() =>
//       _ChildClothingDetailsPageState();
// }

// class _ChildClothingDetailsPageState extends State<ChildClothingDetailsPage> {
//   bool _isFavorite = false;
//   String _selectedSize = '';
//   String _selectedColor = '';
//   int _currentImageIndex = 0;
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     super.initState();
//     _selectedSize =
//         widget.item['sizes'].isNotEmpty ? widget.item['sizes'][0] : '';
//     _selectedColor =
//         widget.item['colors'].isNotEmpty ? widget.item['colors'][0] : '';
//   }

//   void _toggleFavorite() {
//     setState(() {
//       _isFavorite = !_isFavorite;
//     });
//   }

//   void _selectSize(String size) {
//     setState(() {
//       _selectedSize = size;
//     });
//   }

//   void _selectColor(String color) {
//     setState(() {
//       _selectedColor = color;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<String> images = widget.item['images'] ?? [widget.item['image']];

//     return Scaffold(
//       backgroundColor: Colors.white,

//       /// **App Bar**
//       appBar: AppBar(
//         centerTitle: true,
//         title: Image.asset(
//           'assets/logo3.png',
//           height: 40,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 2,
//         actions: [
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () => Scaffold.of(context).openEndDrawer(),
//             ),
//           ),
//         ],
//       ),
//       endDrawer: CustomDrawer(
//         userName: widget.child.name,
//         userEmail:
//             "${widget.child.name.toLowerCase().replaceAll(' ', '_')}@tinyfits.com",
//       ),

//       /// **Body Content**
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// **Image Carousel**
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       height: 280,
//                       width: double.infinity,
//                       child: PageView.builder(
//                         controller: _pageController,
//                         itemCount: images.length,
//                         onPageChanged: (index) {
//                           setState(() {
//                             _currentImageIndex = index;
//                           });
//                         },
//                         itemBuilder: (context, index) {
//                           return Image.asset(
//                             images[index],
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//                     ),

//                     /// **Left Arrow**
//                     Positioned(
//                       left: 10,
//                       top: 130,
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back_ios,
//                             color: Colors.black54),
//                         onPressed: () {
//                           if (_currentImageIndex > 0) {
//                             _pageController.previousPage(
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           }
//                         },
//                       ),
//                     ),

//                     /// **Right Arrow**
//                     Positioned(
//                       right: 10,
//                       top: 130,
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_forward_ios,
//                             color: Colors.black54),
//                         onPressed: () {
//                           if (_currentImageIndex < images.length - 1) {
//                             _pageController.nextPage(
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             /// **Product Name & Favorite Button**
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.item['name'],
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: _toggleFavorite,
//                   child: Icon(
//                     _isFavorite ? Icons.favorite : Icons.favorite_border,
//                     color: _isFavorite ? AppColors.themePink : Colors.black,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             /// **Growth Forecast & Size Recommendation**
//             _buildInfoCard(
//                 "Growth Forecast", "Expected size increase in 3 months: +2cm"),
//             _buildInfoCard("Size Recommendation",
//                 "Best fit for current measurements: ${_selectedSize}"),

//             const SizedBox(height: 16),

//             /// **Size & Colors Selection**
//             /// **Size & Colors Selection inside Equal Sized Cards**
//             Row(
//               children: [
//                 /// **Size Selection (Inside a Uniform Card)**
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.15),
//                           blurRadius: 8,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Available Sizes",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 9),
//                         Wrap(
//                           spacing: 10,
//                           children: widget.item['sizes'].map<Widget>((size) {
//                             return GestureDetector(
//                               onTap: () => _selectSize(size),
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 300),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 10),
//                                 decoration: BoxDecoration(
//                                   color: _selectedSize == size
//                                       ? AppColors.themeBlue
//                                       : Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                     color: _selectedSize == size
//                                         ? AppColors.themeBlue
//                                         : Colors.grey,
//                                     width: 1.5,
//                                   ),
//                                   boxShadow: [
//                                     if (_selectedSize == size)
//                                       BoxShadow(
//                                         color: AppColors.themeBlue
//                                             .withOpacity(0.3),
//                                         blurRadius: 5,
//                                         spreadRadius: 1,
//                                       ),
//                                   ],
//                                 ),
//                                 child: Text(
//                                   size,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: _selectedSize == size
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 12), // **Spacing between cards**

//                 /// **Available Colors (Inside a Uniform Card)**
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.15),
//                           blurRadius: 8,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Available Colors",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 12),
//                         Wrap(
//                           spacing: 10,
//                           children: widget.item['colors'].map<Widget>((color) {
//                             return GestureDetector(
//                               onTap: () => _selectColor(color),
//                               child: CircleAvatar(
//                                 radius:
//                                     20, // **Same size for all color bubbles**
//                                 backgroundColor: _selectedColor == color
//                                     ? Colors.black
//                                     : Colors.grey[300],
//                                 child: CircleAvatar(
//                                   radius: 16,
//                                   backgroundColor: _getColorFromName(color),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                         // const SizedBox(height: 12),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),

//       /// **Bottom Navigation Bar**
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.grey,
//         unselectedItemColor: Colors.grey,
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.checkroom),
//             label: 'Clothing',
//           ),

//           /// **Child Profile Image or Initial**
//           BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProfilePage(card: child),
//                   ),
//                 );
//               },
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.grey[300],
//                 backgroundImage: child.imageUrl != null
//                     ? NetworkImage(child.imageUrl!)
//                     : null,
//                 child: child.imageUrl == null
//                     ? Text(
//                         child.name[0].toUpperCase(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     : null,
//               ),
//             ),
//             label: child.name,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const ClothingPage()),
//             );
//           } else if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProfilePage(card: child),
//               ),
//             );
//           } else if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
//             );
//           }
//         },
//       ),
//     );
//   }

//   /// **Reusable Info Card**
//   Widget _buildInfoCard(String title, String description) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 4),
//           Text(description,
//               style: const TextStyle(fontSize: 14, color: Colors.black87)),
//         ],
//       ),
//     );
//   }
// }

// /// **Function to Convert Color Name to Color Code**
// Color _getColorFromName(String colorName) {
//   switch (colorName.toLowerCase()) {
//     case "red":
//       return const Color.fromARGB(255, 212, 111, 104);
//     case "blue":
//       return const Color.fromARGB(255, 102, 140, 174);
//     case "green":
//       return const Color.fromARGB(255, 56, 114, 58);
//     case "pink":
//       return const Color.fromARGB(255, 250, 159, 233);
//     case "purple":
//       return const Color.fromARGB(255, 173, 119, 221);
//     case "yellow":
//       return const Color.fromARGB(255, 216, 184, 98);
//     case "brown":
//       return const Color.fromARGB(255, 90, 75, 33);
//     default:
//       return const Color.fromARGB(255, 209, 181, 138); // Default beige
//   }
// }

import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:tinyfits_app/screens/clothing_page.dart';
import 'package:tinyfits_app/screens/profile_page.dart';
import 'package:tinyfits_app/screens/home_page.dart';

class ChildClothingDetailsPage extends StatefulWidget {
  final ChildCard child;
  final Map<String, dynamic> item;

  const ChildClothingDetailsPage(
      {super.key, required this.child, required this.item});

  @override
  State<ChildClothingDetailsPage> createState() =>
      _ChildClothingDetailsPageState();
}

class _ChildClothingDetailsPageState extends State<ChildClothingDetailsPage> {
  bool _isFavorite = false;
  String _selectedSize = '';
  String _selectedColor = '';
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _selectedSize =
        widget.item['sizes'].isNotEmpty ? widget.item['sizes'][0] : '';
    _selectedColor =
        widget.item['colors'].isNotEmpty ? widget.item['colors'][0] : '';
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  void _selectColor(String color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = widget.item['images'] ?? [widget.item['image']];

    return Scaffold(
      backgroundColor: Colors.white,

      /// **App Bar with Logo & Favorite Button**
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
      endDrawer: const CustomDrawer(
        userName: "John Doe",
        userEmail: "johndoe@email.com",
      ),

      /// **Body Content**
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Image Carousel**
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),

                    /// **Left Arrow**
                    Positioned(
                      left: 10,
                      top: 130,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black54),
                        onPressed: () {
                          if (_currentImageIndex > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),

                    /// **Right Arrow**
                    Positioned(
                      right: 10,
                      top: 130,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.black54),
                        onPressed: () {
                          if (_currentImageIndex < images.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// **Product Details**
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **Product Name**
                  /// **Product Name (Centered)**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item['name'],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              _isFavorite ? AppColors.themePink : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  /// **Description**
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item['description'],
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const Divider(height: 20, thickness: 1),

                  /// **Material & Care**
                  const Text(
                    "Material & Care",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item['material'],
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            /// **Growth Forecast & Size Recommendation**
            Row(
              children: [
                Expanded(
                    child: _buildDetailCard("Growth Forecast",
                        "Predicted Size: M (based on growth data)")),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: _buildDetailCard("Size Recommendation",
                        "Recommended Size: ${widget.item['sizes'][0]}")),
              ],
            ),

            /// **Size & Colors Selection**
            /// **Size & Colors Selection inside Equal Sized Cards**
            Row(
              children: [
                /// **Size Selection (Inside a Uniform Card)**
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Available Sizes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        Wrap(
                          spacing: 10,
                          children: widget.item['sizes'].map<Widget>((size) {
                            return GestureDetector(
                              onTap: () => _selectSize(size),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: _selectedSize == size
                                      ? AppColors.themeBlue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _selectedSize == size
                                        ? AppColors.themeBlue
                                        : Colors.grey,
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    if (_selectedSize == size)
                                      BoxShadow(
                                        color: AppColors.themeBlue
                                            .withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      ),
                                  ],
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedSize == size
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12), // **Spacing between cards**

                /// **Available Colors (Inside a Uniform Card)**
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Available Colors",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          children: widget.item['colors'].map<Widget>((color) {
                            return GestureDetector(
                              onTap: () => _selectColor(color),
                              child: CircleAvatar(
                                radius:
                                    20, // **Same size for all color bubbles**
                                backgroundColor: _selectedColor == color
                                    ? Colors.black
                                    : Colors.grey[300],
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: _getColorFromName(color),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        // const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                    builder: (context) => ProfilePage(card: widget.child),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[300],
                backgroundImage: widget.child.imageUrl != null
                    ? NetworkImage(widget.child.imageUrl!)
                    : null,
                child: widget.child.imageUrl == null
                    ? Text(
                        widget.child.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
            label: widget.child.name,
          ),

          const BottomNavigationBarItem(
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
                builder: (context) => ProfilePage(card: widget.child),
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

  /// **Function to Convert Color Name to Color Code**
  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case "red":
        return const Color.fromARGB(255, 212, 111, 104);
      case "blue":
        return const Color.fromARGB(255, 102, 140, 174);
      case "green":
        return const Color.fromARGB(255, 56, 114, 58);
      case "pink":
        return const Color.fromARGB(255, 250, 159, 233);
      case "purple":
        return const Color.fromARGB(255, 173, 119, 221);
      case "yellow":
        return const Color.fromARGB(255, 216, 184, 98);
      case "brown":
        return const Color.fromARGB(255, 90, 75, 33);
      default:
        return const Color.fromARGB(255, 209, 181, 138); // Default beige
    }
  }

  /// **Reusable Detail Card**
  Widget _buildDetailCard(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}
