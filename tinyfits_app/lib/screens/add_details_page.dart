import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final List<String> genderOptions = ['Male', 'Female'];
  String selectedGender = 'Male';

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
    _heightController.dispose();
    _weightController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Child'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                    _buildTextField("Name", _nameController),
                    _buildTextField("Date of Birth", _dobController,
                        isDate: true),
                    _buildGenderSelector(),
                    _buildTextField("Height (in cm)", _heightController),
                    _buildTextField("Weight (in kg)", _weightController),
                    _buildTextField("Add a note", _noteController,
                        required: false),
                    const SizedBox(height: 16),

                    /// **Save Button**
                    ElevatedButton(
                      onPressed: _saveChild,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeBlue,
                        minimumSize:
                            const Size(double.infinity, 45), // Reduced height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Add Child",
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
    bool required = true,
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: isDate ? const Icon(Icons.calendar_today) : null,
        ),
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          if (label == 'Weight (in kg)' &&
              (double.tryParse(value!) == null || double.parse(value) > 60)) {
            return 'Weight must be a number and cannot exceed 60 kg';
          }
          if (label == 'Height (in cm)' &&
              (double.tryParse(value!) == null || double.parse(value) > 150)) {
            return 'Height must be a number and cannot exceed 150 cm';
          }
          return null;
        },
      ),
    );
  }

  /// 📌 **Date Picker**
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  /// 📌 **Gender Selector (Reduced Height)**
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
                      color: isSelected
                          ? AppColors.themeBlue!
                          : Colors.grey[300]!),
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

  /// 📌 **Save Child Function**
  void _saveChild() {
    if (_formKey.currentState!.validate()) {
      final newChild = ChildCard(
        name: _nameController.text,
        dateOfBirth: _dobController.text,
        gender: selectedGender,
        height: _heightController.text,
        weight: _weightController.text,
        note: _noteController.text,
      );
      Navigator.pop(context, newChild);
    }
  }
}
