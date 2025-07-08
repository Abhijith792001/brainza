final List<String> tabName = ['All', ' State Gov', ' Central Gov'];


class JobModel {
  final String title;
  final String department;
  final String type;
  final String lastDate;
  final String salary;
  final String description;
  final String eligibility;
  final String selection;
  final String apply;
  final bool freeToApply;

  JobModel({
    required this.title,
    required this.department,
    required this.type,
    required this.lastDate,
    required this.salary,
    required this.description,
    required this.eligibility,
    required this.selection,
    required this.apply,
    required this.freeToApply,
  });

  factory JobModel.fromMap(Map<String, dynamic> data) {
    return JobModel(
      title: data['title'] ?? '',
      department: data['department'] ?? '',
      type: data['type'] ?? '',
      lastDate: data['lastDate'] ?? '',
      salary: data['salary'] ?? '',
      description: data['description'] ?? '',
      eligibility: data['eligibility'] ?? '',
      selection: data['selection'] ?? '',
      apply: data['apply'] ?? '',
      freeToApply: data['freeToApply'] ?? false,
    );
  }
}
