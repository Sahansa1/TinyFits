import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _noteController = TextEditingController();

  final List<String> genderOptions = ['Male', 'Female'];
  String selectedGender = 'Male';

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _noteController.dispose();
    super.dispose();
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
                        color: isSelected ? Colors.blue[200] : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue[200]!
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
                _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              _buildTextField(
                'Date of Birth',
                _dobController,
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
                _heightController,
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
                _weightController,
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
                _noteController,
                required: false,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChild,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Add Child'),
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
        decoration: InputDecoration(
          labelText: label + (required ? ' *' : ''),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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
