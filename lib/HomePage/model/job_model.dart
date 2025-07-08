class JobModel {
  final String title;
  final String subtitle;
  final String description;
  final String imgURL;
  final String qualification;
  final String age;
  final String salary;

  JobModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imgURL,
    required this.qualification,
    required this.age,
    required this.salary,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      imgURL: json['imgURL'] ?? '',
      qualification: json['qualification'] ?? '',
      age: json['age'] ?? '',
      salary: json['salary'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'imgURL': imgURL,
      'qualification': qualification,
      'age': age,
      'salary': salary,
    };
  }

  static void fromMap(Map<String, dynamic> data) {}
}


const jobListings = [
  {
    "title": "Agniveer",
    "subtitle": "Train Hard, Fight Smart",
    "description": "Join Indian Army as Agniveer for 4 years service with technical training, physical fitness development, and nation service opportunity.",
    "imgURL": "https://images.firstpost.com/wp-content/uploads/2022/06/agniveer.jpg?im=FitAndFill=(1200,675)",
    "qualification": "10+2 Pass",
    "age": "17.5-21 years",
    "salary": "₹30,000-₹40,000"
  },
  {
    "title": "Army Officer",
    "subtitle": "Push Limits, Break Barriers",
    "description": "Lead troops as commissioned officer in Indian Army through NDA, CDS, or direct entry. Command responsibilities and strategic operations.",
    "imgURL": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnSGOdy211urczq4D2-_HFK_W7l9w06UNNMw&s",
    "qualification": "Graduate",
    "age": "19-24 years",
    "salary": "₹56,100-₹1,77,500"
  },
  {
    "title": "Navy Sailor",
    "subtitle": "Indian Navy Enlisted Personnel",
    "description": "Serve in Indian Navy as sailor in various trades like technical, communication, logistics, and marine operations on ships and submarines.",
    "imgURL": "https://bsmedia.business-standard.com/_media/bs/img/article/2019-07/08/full/1562561066-8055.jpg",
    "qualification": "10+2 Pass",
    "age": "17-21 years",
    "salary": "₹26,200-₹69,100"
  },
];