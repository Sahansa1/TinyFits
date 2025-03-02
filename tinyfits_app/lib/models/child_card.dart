class ChildCard {
  final String name;
  final String dateOfBirth;
  final String gender;
  final String height;
  final String weight;
  final String? note;
  final String? imageUrl;
  final List<Map<String, dynamic>> pastMeasurements;

  ChildCard({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.weight,
    this.note,
    this.imageUrl,
    required this.pastMeasurements,
  });
}
