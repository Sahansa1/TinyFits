import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinyfits_app/screens/past_measurements_page.dart';
import 'dart:io';

class EditDetailsPage extends StatefulWidget {
  final ChildCard card;

  const EditDetailsPage({super.key, required this.card});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController noteController;

  final List<String> genderOptions = ['Male', 'Female'];
  late String selectedGender;

  late ImagePicker _picker;
  File? _image;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.card.name);
    dobController = TextEditingController(text: widget.card.dateOfBirth);
    heightController = TextEditingController(text: widget.card.height);
    weightController = TextEditingController(text: widget.card.weight);
    noteController = TextEditingController(text: widget.card.note);
    selectedGender = widget.card.gender;
    if (!genderOptions.contains(selectedGender)) {
      selectedGender = genderOptions[0]; // Default to first option if invalid
    }
    _picker = ImagePicker();
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
    noteController.dispose();
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
                            child: Image.file(
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
                      onTap: _pickImage, // Call the image picker
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.themeBlue,
                          shape: BoxShape.circle,
                        ),
                        child: _image != null
                            ? const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              )
                            : const Icon(
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
                color: AppColors.themeOrange, // Background color matches design
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formKey,
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
                    _buildTextField("Name", nameController),
                    _buildTextField("Date of Birth", dobController,
                        isDate: true),
                    _buildGenderSelector(),
                    _buildTextField("Height (in cm)", heightController),
                    _buildTextField("Weight (in kg)", weightController),
                    _buildTextField("Add a note", noteController,
                        required: false),
                    const SizedBox(height: 16),

                    /// **Save Button**
                    ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeBlue,
                        minimumSize:
                            const Size(double.infinity, 45), // Reduced height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Save details",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 📌 **Reusable Input Field
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
          suffixIcon: _getSuffixIcon(label, isDate),
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
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       dobController.text = "${picked.day}/${picked.month}/${picked.year}";
  //     });
  //   }
  //}

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themePurple, // Header color
            colorScheme: ColorScheme.light(
              primary: AppColors.themePurple, // Selected date color
              onPrimary: Colors.white, // Text color on selected date
              onSurface: Colors.black, // Default text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
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

  /// 📌 **Save Changes Function**
  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedCard = ChildCard(
        name: nameController.text,
        dateOfBirth: dobController.text,
        gender: selectedGender,
        height: heightController.text,
        weight: weightController.text,
        note: noteController.text,
        imageUrl: widget.card.imageUrl,
        pastMeasurements: [],
      );
      Navigator.pop(context, updatedCard);
    }
  }

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

  Widget? _getSuffixIcon(String label, bool isDate) {
    if (isDate) {
      return const Icon(Icons.calendar_today);
    } else if (label.contains('Height') || label.contains('Weight')) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.themeGreen,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.history,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PastMeasurementsPage(
                  pastMeasurements: pastRecords, // Pass stored data
                ),
              ),
            );

            // Update past records when coming back from PastMeasurementsPage
            if (result != null) {
              setState(() {
                pastRecords = result; // Store updated past measurements
              });
            }
          },
        ),
      );
    }
    return null;
  }
}

List<Map<String, dynamic>> pastRecords = [];
