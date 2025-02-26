import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';
import 'package:tinyfits_app/theme/colors.dart';

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
  late TextEditingController genderController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController noteController;

  final List<String> genderOptions = ['Male', 'Female'];
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.card.name);
    dobController = TextEditingController(text: widget.card.dateOfBirth);
    genderController = TextEditingController(text: widget.card.gender);
    heightController = TextEditingController(text: widget.card.height);
    weightController = TextEditingController(text: widget.card.weight);
    noteController = TextEditingController(text: widget.card.note);
    selectedGender = widget.card.gender;
    if (!genderOptions.contains(selectedGender)) {
      selectedGender = genderOptions[0]; // Default to first option if invalid
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    genderController.dispose();
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
        title: const Text('Edit Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                'Name',
                nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              _buildTextField(
                'Date of Birth',
                dobController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date of birth';
                  }
                  // Add more specific date validation if needed
                  return null;
                },
              ),
              _buildGenderSelector(),
              _buildTextField(
                'Height',
                heightController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter height';
                  }
                  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              _buildTextField(
                'Weight',
                weightController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter weight';
                  }
                  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              _buildTextField(
                'Note',
                noteController,
                required: false,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeBlue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    String? Function(String?)? validator,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        readOnly: label == 'Date of Birth',
        onTap: label == 'Date of Birth' ? () => _selectDate(context) : null,
        decoration: InputDecoration(
          labelText: label + (required ? ' *' : ''),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: label == 'Date of Birth'
              ? const Icon(Icons.calendar_today)
              : null,
        ),
        validator: validator ??
            (required
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }
                : null),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    // Parse existing date or use current date as default
    DateTime initialDate;
    try {
      List<String> parts = dobController.text.split('/');
      initialDate = DateTime(
        int.parse(parts[2]), // year
        int.parse(parts[1]), // month
        int.parse(parts[0]), // day
      );
    } catch (e) {
      initialDate = DateTime.now();
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Widget _buildGenderSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender *',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: genderOptions.map((gender) {
              bool isSelected = selectedGender == gender;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: gender == 'Male' ? 8.0 : 0,
                    left: gender == 'Female' ? 8.0 : 0,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = gender;
                      });
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.themeBlue : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.themeBlue!
                              : Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          gender,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

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
      );

      Navigator.pop(context, updatedCard);
    }
  }
}
