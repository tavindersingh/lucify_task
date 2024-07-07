class Course {
  final String id;
  final String code;

  bool isSelected;

  Course({
    required this.id,
    required this.code,
    this.isSelected = false,
  });
}
