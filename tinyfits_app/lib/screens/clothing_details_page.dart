// import 'package:flutter/material.dart';

// class ClothingDetailsPage extends StatefulWidget {
//   final Map<String, dynamic> item;

//   const ClothingDetailsPage({super.key, required this.item});

//   @override
//   State<ClothingDetailsPage> createState() => _ClothingDetailsPageState();
// }

// class _ClothingDetailsPageState extends State<ClothingDetailsPage> {
//   int _currentImageIndex = 0;
//   String _selectedColor = '';
//   String _selectedSize = '';

//   @override
//   void initState() {
//     super.initState();
//     _selectedColor = widget.item['colors'].isNotEmpty
//         ? widget.item['colors'][0]['name']
//         : '';
//     _selectedSize =
//         widget.item['sizes'].isNotEmpty ? widget.item['sizes'][0]['size'] : '';
//   }

//   void _changeColor(String color) {
//     setState(() {
//       _selectedColor = color;
//       _currentImageIndex = 0; // Reset image when color is changed
//     });
//   }

//   void _changeImage(bool next) {
//     setState(() {
//       final colorData = widget.item['colors'].firstWhere(
//         (c) => c['name'] == _selectedColor,
//         orElse: () =>
//             widget.item['colors'].isNotEmpty ? widget.item['colors'][0] : null,
//       );

//       if (colorData == null || colorData['images'] == null) {
//         _currentImageIndex = 0; // Fallback to prevent crashing
//         return;
//       }

//       int imageCount = (colorData['images'] as List).length;

//       if (next) {
//         _currentImageIndex = ((_currentImageIndex + 1) % imageCount).toInt();
//       } else {
//         _currentImageIndex = ((_currentImageIndex - 1) < 0
//                 ? imageCount - 1
//                 : _currentImageIndex - 1)
//             .toInt();
//       }
//     });
//   }

//   void _selectSize(String size) {
//     setState(() {
//       _selectedSize = size;
//     });
//   }

//   bool _isFavorite = false;

//   void _toggleFavorite() {
//     setState(() {
//       _isFavorite = !_isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorData =
//         widget.item['colors'].firstWhere((c) => c['name'] == _selectedColor);
//     final List<String> images = colorData['images'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.item['name']),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: Colors.red),
//             onPressed: _toggleFavorite,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// **Image Carousel**
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     images[_currentImageIndex],
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Positioned(
//                   left: 10,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back_ios, size: 20),
//                     onPressed: () => _changeImage(false),
//                   ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_forward_ios, size: 20),
//                     onPressed: () => _changeImage(true),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             /// **Clothing Name**
//             Text(
//               widget.item['name'],
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),

//             /// **Color Selection**
//             Text(
//               "Colors",
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: widget.item['colors'].map<Widget>((color) {
//                 return GestureDetector(
//                   onTap: () => _changeColor(color['name']),
//                   child: Container(
//                     margin: const EdgeInsets.only(right: 8),
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: color['hex'],
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: _selectedColor == color['name']
//                             ? Colors.black
//                             : Colors.grey,
//                         width: _selectedColor == color['name'] ? 2 : 1,
//                       ),
//                     ),
//                     width: 30,
//                     height: 30,
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 12),

//             /// **Description**
//             Text("Description",
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(widget.item['description'],
//                 style: const TextStyle(fontSize: 14, color: Colors.black87)),
//             const SizedBox(height: 12),

//             /// **Material & Care**
//             Text("Material & Care",
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(widget.item['material'],
//                 style: const TextStyle(fontSize: 14, color: Colors.black87)),
//             const SizedBox(height: 12),

//             /// **Manual Size Selection**
//             Text("Manual Size Selection",
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Column(
//               children: widget.item['sizes'].map<Widget>((sizeData) {
//                 return GestureDetector(
//                   onTap: () => _selectSize(sizeData['size']),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: _selectedSize == sizeData['size']
//                           ? Colors.blue[100]
//                           : Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               _selectedSize == sizeData['size']
//                                   ? Icons.radio_button_checked
//                                   : Icons.radio_button_off,
//                               color: _selectedSize == sizeData['size']
//                                   ? Colors.blue
//                                   : Colors.grey,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               sizeData['size'],
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           sizeData['age'],
//                           style: const TextStyle(color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ClothingDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ClothingDetailsPage({super.key, required this.item});

  @override
  State<ClothingDetailsPage> createState() => _ClothingDetailsPageState();
}

class _ClothingDetailsPageState extends State<ClothingDetailsPage> {
  bool _isFavorite = false;
  String _selectedSize = '';

  @override
  void initState() {
    super.initState();
    _selectedSize =
        widget.item['sizes'].isNotEmpty ? widget.item['sizes'][0] : '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['name']),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Image Section**
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.item['image'],
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// **Clothing Name**
            Text(
              widget.item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            /// **Description**
            Text(
              "Description",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              widget.item['description'],
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 12),

            /// **Material & Care**
            Text(
              "Material & Care",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              widget.item['material'],
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 16),

            /// **Manual Size Selection**
            Text(
              "Manual Size Selection",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: widget.item['sizes'].map<Widget>((size) {
                return GestureDetector(
                  onTap: () => _selectSize(size),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedSize == size
                          ? Colors.blue[100]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _selectedSize == size
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: _selectedSize == size
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              size,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
