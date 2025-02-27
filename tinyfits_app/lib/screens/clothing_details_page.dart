// import 'package:flutter/material.dart';
// import 'package:tinyfits_app/theme/colors.dart';
// import 'package:tinyfits_app/screens/custom_drawer.dart';

// class ClothingDetailsPage extends StatefulWidget {
//   final Map<String, dynamic> item;

//   const ClothingDetailsPage({super.key, required this.item});

//   @override
//   State<ClothingDetailsPage> createState() => _ClothingDetailsPageState();
// }

// class _ClothingDetailsPageState extends State<ClothingDetailsPage> {
//   bool _isFavorite = false;
//   String _selectedSize = '';
//   int _currentImageIndex = 0;
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     super.initState();
//     _selectedSize =
//         widget.item['sizes'].isNotEmpty ? widget.item['sizes'][0] : '';
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

//   @override
//   Widget build(BuildContext context) {
//     List<String> images = widget.item['images'] ?? [widget.item['image']];

//     return Scaffold(
//       backgroundColor: Colors.white,

//       /// **App Bar with Logo & Menu**
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
//       endDrawer: const CustomDrawer(
//         userName: "John Doe",
//         userEmail: "johndoe@email.com",
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// **Image Carousel with Proper Sizing**
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200], // Light Background for Contrast
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       height: 280, // Properly sized image
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

//                     /// **Dots Indicator (Centered)**
//                     Positioned(
//                       bottom: 10,
//                       left: 0,
//                       right: 0,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(images.length, (index) {
//                           return Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 4),
//                             width: _currentImageIndex == index ? 8 : 6,
//                             height: _currentImageIndex == index ? 8 : 6,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _currentImageIndex == index
//                                   ? AppColors.themeBlue
//                                   : Colors.grey,
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             /// **Product Details**
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.15),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// **Product Name**
//                   /// **Product Name (Centered)**
//                   Center(
//                     child: Text(
//                       widget.item['name'],
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   /// **Description**
//                   const Text(
//                     "Description",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     widget.item['description'],
//                     style: const TextStyle(fontSize: 14, color: Colors.black87),
//                   ),
//                   const Divider(height: 20, thickness: 1),

//                   /// **Material & Care**
//                   const Text(
//                     "Material & Care",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     widget.item['material'],
//                     style: const TextStyle(fontSize: 14, color: Colors.black87),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             /// **Manual Size Selection**
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: AppColors.themeOrange.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Select Size",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),

//                   /// **Size Options**
//                   Wrap(
//                     spacing: 12,
//                     runSpacing: 8,
//                     children: widget.item['sizes'].map<Widget>((size) {
//                       return GestureDetector(
//                         onTap: () => _selectSize(size),
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: _selectedSize == size
//                                 ? AppColors.themeBlue
//                                 : Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: _selectedSize == size
//                                   ? AppColors.themeBlue
//                                   : Colors.grey,
//                               width: 1.5,
//                             ),
//                           ),
//                           child: Text(
//                             size,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: _selectedSize == size
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),

//                   const SizedBox(height: 16),

//                   /// **Available Colors**
//                   const Text(
//                     "Available Colors",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     widget.item['colors'].join(', '),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:tinyfits_app/screens/custom_drawer.dart';
import 'package:tinyfits_app/screens/clothing_page.dart';
import 'package:tinyfits_app/screens/add_details_page.dart';
import 'package:tinyfits_app/screens/profile_page.dart';

class ClothingDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ClothingDetailsPage({super.key, required this.item});

  @override
  State<ClothingDetailsPage> createState() => _ClothingDetailsPageState();
}

class _ClothingDetailsPageState extends State<ClothingDetailsPage> {
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
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: _toggleFavorite,
          ),
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

                    /// **Dots Indicator**
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentImageIndex == index ? 8 : 6,
                            height: _currentImageIndex == index ? 8 : 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == index
                                  ? AppColors.themeBlue
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// **Product Name (Centered)**
            Center(
              child: Text(
                widget.item['name'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// **Size & Colors Selection (Side by Side)**
            Row(
              children: [
                /// **Size Selection**
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Size",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
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

                /// **Available Colors**
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Available Colors",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: widget.item['colors'].map<Widget>((color) {
                          return GestureDetector(
                            onTap: () => _selectColor(color),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: _selectedColor == color
                                  ? Colors.black
                                  : Colors.grey[300],
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: color == "Red"
                                    ? Colors.red
                                    : color == "Blue"
                                        ? Colors.blue
                                        : color == "Green"
                                            ? Colors.green
                                            : Colors.orange,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
