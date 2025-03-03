import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tinyfits_app/screens/past_measurements_page.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  final List<String> genderOptions = ['Male', 'Female'];
  String selectedGender = 'Male';

  List<Map<String, dynamic>> pastMeasurements = [];

  File? _image;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// **Profile Picture Upload**
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: _image != null
                          ? ClipOval(
                              child: kIsWeb
                                  ? Image.network(
                                      _image!.path,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      _image!,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                            )
                          : Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey[400],
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.themeBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// **Child Details Card**
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.themeOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    /// **Title**
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Child's Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// **Input Fields**
                    _buildTextField("Name", _nameController, isRequired: true),
                    _buildTextField("Date of Birth", _dobController,
                        isDate: true, isRequired: true),

                    _buildGenderSelector(),
                    _buildTextField("Add a note", _noteController,
                        isRequired: false),

                    ElevatedButton(
                      onPressed: _navigateToPastMeasurements,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themePeach,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Enter Past Measurements",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    /// **Save Button (Enabled Only if Past Measurements Exist)**
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:
                          pastMeasurements.isNotEmpty ? _saveChild : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pastMeasurements.isNotEmpty
                            ? AppColors.themeBlue
                            : Colors.grey,
                        minimumSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Save Child",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  /// 📌 **Reusable Input Field**
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isRequired = false,
    bool isDate = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        readOnly: isDate,
        onTap: isDate ? () => _selectDate(context) : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  /// 📌 **Navigate to Past Measurements Page**
  void _navigateToPastMeasurements() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PastMeasurementsPage(
          dateOfBirth: _dobController.text,
          pastMeasurements: pastMeasurements,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        pastMeasurements = result; // Store updated past measurements
      });
    }
  }

  /// 📌 **Save Child Function**
  void _saveChild() {
    if (_formKey.currentState!.validate() && pastMeasurements.isNotEmpty) {
      final newChild = ChildCard(
        name: _nameController.text,
        dateOfBirth: _dobController.text,
        gender: selectedGender,
        pastMeasurements: pastMeasurements,
      );
      Navigator.pop(context, newChild);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add at least one past measurement"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime fiveYearsAgo =
        DateTime(currentDate.year - 5, currentDate.month, currentDate.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fiveYearsAgo, // Default to 5 years ago
      firstDate:
          fiveYearsAgo, // Restrict minimum selectable date to 5 years ago
      lastDate: currentDate, // Restrict maximum selectable date to today
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themePurple, // Header color
            colorScheme: const ColorScheme.light(
              primary: AppColors.themePurple, // Selected date color
              onPrimary: Colors.white, // Text color on selected date
              onSurface: Colors.black, // Default text color
            ),
            // dialogBackgroundColor:
            //  Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // 📌 **Gender Selector (Reduced Height)**
  Widget _buildGenderSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: genderOptions.map((gender) {
          bool isSelected = selectedGender == gender;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = gender;
                });
              },
              child: Container(
                height: 40, // Reduced height
                margin: EdgeInsets.only(
                    right: gender == "Male" ? 8.0 : 0,
                    left: gender == "Female" ? 8.0 : 0),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.themeBlue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color:
                          isSelected ? AppColors.themeBlue : Colors.grey[300]!),
                ),
                child: Center(
                  child: Text(
                    gender,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
