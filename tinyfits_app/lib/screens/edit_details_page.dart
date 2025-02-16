import 'package:flutter/material.dart';
import 'package:tinyfits_app/models/child_card.dart';

class EditDetailsPage extends StatefulWidget {
  final ChildCard card;

  const EditDetailsPage({super.key, required this.card});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.card.name);
    dobController = TextEditingController(text: widget.card.dateOfBirth);
    genderController = TextEditingController(text: widget.card.gender);
    heightController = TextEditingController(text: widget.card.height);
    weightController = TextEditingController(text: widget.card.weight);
    noteController = TextEditingController(text: widget.card.note);
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
        child: Column(
          children: [
            _buildTextField('Name', nameController),
            _buildTextField('Date of Birth', dobController),
            _buildTextField('Gender', genderController),
            _buildTextField('Height', heightController),
            _buildTextField('Weight', weightController),
            _buildTextField('Note', noteController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    final updatedCard = ChildCard(
      name: nameController.text,
      dateOfBirth: dobController.text,
      gender: genderController.text,
      height: heightController.text,
      weight: weightController.text,
      note: noteController.text,
      imageUrl: widget.card.imageUrl,
    );

    Navigator.pop(context, updatedCard);
  }
}
