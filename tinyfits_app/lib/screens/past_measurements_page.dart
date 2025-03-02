// // import 'package:flutter/material.dart';
// // import 'package:tinyfits_app/theme/colors.dart';
// // import 'package:tinyfits_app/screens/growth_chart_page.dart';

// // class PastMeasurementsPage extends StatefulWidget {
// //   final List<Map<String, dynamic>> pastMeasurements;
// //   final String dateOfBirth;

// //   const PastMeasurementsPage({
// //     super.key,
// //     required this.pastMeasurements,
// //     required this.dateOfBirth, // Initialize it
// //   });

// //   @override
// //   _PastMeasurementsPageState createState() => _PastMeasurementsPageState();
// // }

// // class _PastMeasurementsPageState extends State<PastMeasurementsPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _dateController = TextEditingController();
// //   final TextEditingController _heightController = TextEditingController();
// //   final TextEditingController _weightController = TextEditingController();
// //   List<Map<String, dynamic>> pastRecords = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     pastRecords = List.from(widget.pastMeasurements);
// //   }

// //   void _addRecord() {
// //     if (_dateController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Please select a date"),
// //           backgroundColor: Colors.redAccent,
// //         ),
// //       );
// //       return;
// //     }

// //     if (_heightController.text.isEmpty && _weightController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Enter at least one measurement (Height or Weight)"),
// //           backgroundColor: Colors.redAccent,
// //         ),
// //       );
// //       return;
// //     }

// //     setState(() {
// //       pastRecords.add({
// //         'date': _dateController.text,
// //         'height': _heightController.text.isNotEmpty
// //             ? double.parse(_heightController.text)
// //             : null,
// //         'weight': _weightController.text.isNotEmpty
// //             ? double.parse(_weightController.text)
// //             : null,
// //       });

// //       // Clear fields after adding record
// //       _dateController.clear();
// //       _heightController.clear();
// //       _weightController.clear();
// //     });
// //   }

// //   void _deleteRecord(int index) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(20),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 CircleAvatar(
// //                   radius: 24,
// //                   backgroundColor: Colors.redAccent,
// //                   child: const Icon(
// //                     Icons.warning_amber_rounded,
// //                     color: Colors.white,
// //                     size: 28,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 const Text(
// //                   'Delete this record?',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(height: 8),
// //                 const Text(
// //                   "This action cannot be undone.",
// //                   style: TextStyle(fontSize: 14, color: Colors.black54),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           setState(() {
// //                             pastRecords.removeAt(index);
// //                           });
// //                           Navigator.pop(context);
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.redAccent,
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                         ),
// //                         child: const Text(
// //                           "Yes, delete",
// //                           style: TextStyle(color: Colors.white),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     Expanded(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           Navigator.pop(context);
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.grey[300],
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                         ),
// //                         child: const Text(
// //                           "Cancel",
// //                           style: TextStyle(color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: Image.asset(
// //           'assets/logo3.png',
// //           height: 40,
// //         ),
// //         backgroundColor: Colors.white,
// //         elevation: 2,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             /// **Form Section**
// //             Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.orange[200],
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Column(
// //                 children: [
// //                   const Text(
// //                     "Add Past Measurements",
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Form(
// //                     key: _formKey,
// //                     child: Column(
// //                       children: [
// //                         TextFormField(
// //                           controller: _dateController,
// //                           decoration: InputDecoration(
// //                             labelText: "Date (YYYY-MM-DD)",
// //                             suffixIcon: IconButton(
// //                               icon: const Icon(Icons.calendar_today),
// //                               onPressed: () async {
// //                                 DateTime? pickedDate = await showDatePicker(
// //                                   context: context,
// //                                   initialDate: DateTime.now(),
// //                                   firstDate: DateTime(2000),
// //                                   lastDate: DateTime.now(),
// //                                 );
// //                                 if (pickedDate != null) {
// //                                   _dateController.text =
// //                                       "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
// //                                 }
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 8),
// //                         TextFormField(
// //                           controller: _heightController,
// //                           decoration: const InputDecoration(
// //                             labelText: "Height (cm) - Optional",
// //                           ),
// //                           keyboardType: TextInputType.number,
// //                         ),
// //                         const SizedBox(height: 8),
// //                         TextFormField(
// //                           controller: _weightController,
// //                           decoration: const InputDecoration(
// //                             labelText: "Weight (kg) - Optional",
// //                           ),
// //                           keyboardType: TextInputType.number,
// //                         ),
// //                         const SizedBox(height: 16),
// //                         ElevatedButton(
// //                           onPressed: _addRecord,
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: AppColors.themeBlue,
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(10),
// //                             ),
// //                           ),
// //                           child: const Text(
// //                             "Add Record",
// //                             style: TextStyle(color: Colors.white),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             /// **List of past records**
// //             if (pastRecords.isNotEmpty) ...[
// //               const Text(
// //                 "Previous Records",
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 10),
// //               Column(
// //                 children: pastRecords.map((record) {
// //                   return Container(
// //                     margin: const EdgeInsets.only(bottom: 10),
// //                     padding: const EdgeInsets.all(12),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white, // White background
// //                       borderRadius: BorderRadius.circular(12),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey
// //                               .withOpacity(0.3), // Soft shadow effect
// //                           spreadRadius: 2,
// //                           blurRadius: 5,
// //                           offset: const Offset(0, 2), // Shadow placement
// //                         ),
// //                       ],
// //                     ),
// //                     child: ListTile(
// //                       title: Text(
// //                         "Date: ${record['date']}",
// //                         style: const TextStyle(fontWeight: FontWeight.bold),
// //                       ),
// //                       subtitle: Text(
// //                         "Height: ${record['height'] ?? 'N/A'} cm | Weight: ${record['weight'] ?? 'N/A'} kg",
// //                         style: TextStyle(color: Colors.grey[700]),
// //                       ),
// //                       trailing: GestureDetector(
// //                         onTap: () => _deleteRecord(pastRecords.indexOf(record)),
// //                         child: Container(
// //                           padding: const EdgeInsets.all(6),
// //                           decoration: BoxDecoration(
// //                             color: AppColors.themeBlue, // Theme Blue Circle
// //                             shape: BoxShape.circle,
// //                           ),
// //                           child: const Icon(
// //                             Icons.delete,
// //                             color: Colors.white, // White delete icon
// //                             size: 20,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 }).toList(),
// //               ),
// //             ],

// //             /// **View Growth Chart Button**
// //             const SizedBox(height: 20),
// //             ElevatedButton.icon(
// //               onPressed: _navigateToGrowthChart,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: AppColors.themeGreen,
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //               ),
// //               icon: const Icon(Icons.bar_chart, color: Colors.white),
// //               label: const Text(
// //                 "View Growth Chart",
// //                 style: TextStyle(color: Colors.white, fontSize: 16),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _navigateToGrowthChart() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => GrowthChartPage(
// //             dateOfBirth: widget.dateOfBirth, pastMeasurements: pastRecords),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:tinyfits_app/theme/colors.dart';
// import 'package:tinyfits_app/screens/growth_chart_page.dart';

// class PastMeasurementsPage extends StatefulWidget {
//   final List<Map<String, dynamic>> pastMeasurements;
//   final String dateOfBirth; // Add this parameter

//   const PastMeasurementsPage({
//     super.key,
//     required this.pastMeasurements,
//     required this.dateOfBirth, // Initialize it
//   });

//   @override
//   _PastMeasurementsPageState createState() => _PastMeasurementsPageState();
// }

// class _PastMeasurementsPageState extends State<PastMeasurementsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   List<Map<String, dynamic>> pastRecords = [];

//   @override
//   void initState() {
//     super.initState();
//     pastRecords = List.from(widget.pastMeasurements);
//   }

//   void _addRecord() {
//     if (_dateController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please select a date"),
//           backgroundColor: Colors.redAccent,
//         ),
//       );
//       return;
//     }

//     if (_heightController.text.isEmpty && _weightController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Enter at least one measurement (Height or Weight)"),
//           backgroundColor: Colors.redAccent,
//         ),
//       );
//       return;
//     }

//     setState(() {
//       pastRecords.add({
//         'date': _dateController.text,
//         'height': _heightController.text.isNotEmpty
//             ? double.parse(_heightController.text)
//             : null,
//         'weight': _weightController.text.isNotEmpty
//             ? double.parse(_weightController.text)
//             : null,
//       });

//       // Clear fields after adding record
//       _dateController.clear();
//       _heightController.clear();
//       _weightController.clear();
//     });
//   }

//   void _deleteRecord(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   radius: 24,
//                   backgroundColor: Colors.redAccent,
//                   child: const Icon(
//                     Icons.warning_amber_rounded,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Delete this record?',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "This action cannot be undone.",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             pastRecords.removeAt(index);
//                           });
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "Yes, delete",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey[300],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "Cancel",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Image.asset(
//           'assets/logo3.png',
//           height: 40,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 2,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             /// **Form Section**
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.orange[200],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Add Past Measurements",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: _dateController,
//                           decoration: InputDecoration(
//                             labelText: "Date (YYYY-MM-DD)",
//                             suffixIcon: IconButton(
//                               icon: const Icon(Icons.calendar_today),
//                               onPressed: () => _selectDate(context),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _heightController,
//                           decoration: const InputDecoration(
//                             labelText: "Height (cm) - Optional",
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _weightController,
//                           decoration: const InputDecoration(
//                             labelText: "Weight (kg) - Optional",
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: _addRecord,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.themeBlue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: const Text(
//                             "Add Record",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             /// **List of past records**
//             if (pastRecords.isNotEmpty) ...[
//               const Text(
//                 "Previous Records",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Column(
//                 children: pastRecords.map((record) {
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 10),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white, // White background
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey
//                               .withOpacity(0.3), // Soft shadow effect
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: const Offset(0, 2), // Shadow placement
//                         ),
//                       ],
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         "Date: ${record['date']}",
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         "Height: ${record['height'] ?? 'N/A'} cm | Weight: ${record['weight'] ?? 'N/A'} kg",
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                       trailing: GestureDetector(
//                         onTap: () => _deleteRecord(pastRecords.indexOf(record)),
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: AppColors.themeBlue, // Theme Blue Circle
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.delete,
//                             color: Colors.white, // White delete icon
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],

//             /// **View Growth Chart Button**
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: _navigateToGrowthChart,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.themeGreen,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               icon: const Icon(Icons.bar_chart, color: Colors.white),
//               label: const Text(
//                 "View Growth Chart",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _navigateToGrowthChart() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => GrowthChartPage(
//           pastMeasurements: pastRecords,
//           dateOfBirth: widget.dateOfBirth, // Pass the child's birth date
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     // Parse the child's birth date from the provided "DD/MM/YYYY" format
//     DateTime? birthDate;
//     try {
//       List<String> dateParts = widget.dateOfBirth.split("/");
//       birthDate = DateTime(
//         int.parse(dateParts[2]), // Year
//         int.parse(dateParts[1]), // Month
//         int.parse(dateParts[0]), // Day
//       );
//     } catch (e) {
//       print("Error parsing birth date: $e");
//       return; // Exit function if parsing fails
//     }

//     // Get the current date to restrict future selection
//     DateTime currentDate = DateTime.now();

//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: currentDate, // Default selected date
//       firstDate: birthDate, // Restrict selection to birth date or later
//       lastDate: currentDate, // User cannot pick a future date
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: AppColors.themePurple,
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.themePurple, // Highlighted date color
//               onPrimary: Colors.white, // Text color for selected date
//               onSurface: Colors.black, // Default text color
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text =
//             "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'growth_chart_page.dart';

class PastMeasurementsPage extends StatefulWidget {
  final List<Map<String, dynamic>> pastMeasurements;
  final String dateOfBirth;

  const PastMeasurementsPage({
    super.key,
    required this.pastMeasurements,
    required this.dateOfBirth,
  });

  @override
  _PastMeasurementsPageState createState() => _PastMeasurementsPageState();
}

class _PastMeasurementsPageState extends State<PastMeasurementsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  List<Map<String, dynamic>> pastRecords = [];

  @override
  void initState() {
    super.initState();
    pastRecords = List.from(widget.pastMeasurements);
  }

  /// 📌 **Add Record**
  void _addRecord() {
    if (_dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a date"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (_heightController.text.isEmpty && _weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter at least one measurement (Height or Weight)"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      pastRecords.add({
        'date': _dateController.text,
        'height': _heightController.text.isNotEmpty
            ? double.parse(_heightController.text)
            : null,
        'weight': _weightController.text.isNotEmpty
            ? double.parse(_weightController.text)
            : null,
      });

      // Clear fields after adding record
      _dateController.clear();
      _heightController.clear();
      _weightController.clear();
    });
  }

  /// 📌 **Delete Record**
  void _deleteRecord(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.redAccent,
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Delete this record?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "This action cannot be undone.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pastRecords.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Yes, delete",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo3.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// **Form Section**
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Add Past Measurements",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            labelText: "Date (YYYY-MM-DD)",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _heightController,
                          decoration: const InputDecoration(
                            labelText: "Height (cm) - Optional",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _weightController,
                          decoration: const InputDecoration(
                            labelText: "Weight (kg) - Optional",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _addRecord,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.themeBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Add Record",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// **List of past records**
            if (pastRecords.isNotEmpty) ...[
              const Text(
                "Previous Records",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: pastRecords.map((record) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        "Date: ${record['date']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Height: ${record['height'] ?? 'N/A'} cm | Weight: ${record['weight'] ?? 'N/A'} kg",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: GestureDetector(
                        onTap: () => _deleteRecord(pastRecords.indexOf(record)),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.themeBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 20),

            /// **Save Button**
            ElevatedButton(
              onPressed: () => Navigator.pop(context, pastRecords),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    pastRecords.isNotEmpty ? AppColors.themeBlue : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Save Measurements",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            // **View Growth Chart Button**
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navigateToGrowthChart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeGreen,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.bar_chart, color: Colors.white),
              label: const Text(
                "View Growth Chart",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToGrowthChart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GrowthChartPage(
          pastMeasurements: pastRecords,
          dateOfBirth: widget.dateOfBirth, // Pass the child's birth date
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    // Parse the child's birth date from the provided "DD/MM/YYYY" format
    DateTime? birthDate;
    try {
      List<String> dateParts = widget.dateOfBirth.split("/");
      birthDate = DateTime(
        int.parse(dateParts[2]), // Year
        int.parse(dateParts[1]), // Month
        int.parse(dateParts[0]), // Day
      );
    } catch (e) {
      print("Error parsing birth date: $e");
      return; // Exit function if parsing fails
    }

    // Get the current date to restrict future selection
    DateTime currentDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate, // Default selected date
      firstDate: birthDate, // Restrict selection to birth date or later
      lastDate: currentDate, // User cannot pick a future date
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themePurple,
            colorScheme: const ColorScheme.light(
              primary: AppColors.themePurple, // Highlighted date color
              onPrimary: Colors.white, // Text color for selected date
              onSurface: Colors.black, // Default text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }
}
