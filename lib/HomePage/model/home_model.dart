class CategoryModel {
  final String title;
  final String subtitle;
  final String imgURL;

  CategoryModel({
    required this.title,
    required this.subtitle,
    required this.imgURL,
  });

  // Factory constructor to create from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      imgURL: json['imgURL'] ?? '',
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'subtitle': subtitle, 'imgURL': imgURL};
  }

  static map(CategoryModel Function(dynamic e) param0) {}
}

List categories = [
  {
    "title": "Sports",
    "subtitle": "Latest Sports News & Updates",
    "imgURL": "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400",
  },
  {
    "title": "Technology",
    "subtitle": "Tech News & Innovations",
    "imgURL": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZx_g2K2F99ksuxib171hL0hfKx8c8OopjQ&s",
  },
  {
    "title": "Entertainment",
    "subtitle": "Entertainment Buzz & Updates",
    "imgURL": "https://www.pwc.com/gx/en/entertainment-media/outlook-2021/gemo-anchor-super-hero.jpg",
  },
  {
    "title": "Health",
    "subtitle": "Health News & Wellness Tips",
    "imgURL": "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400",
  },
  {
    "title": "Business",
    "subtitle": "Market Trends & Business News",
    "imgURL": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQScTSBMXtBLuJoPOsb6v_EGNl0MHk_LEhBDg&s",
  },
  {
    "title": "Science",
    "subtitle": "Scientific Discoveries & News",
    "imgURL": "https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=400",
  },
  {
    "title": "Politics",
    "subtitle": "Political News & Analysis",
    "imgURL": "https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?w=400",
  },
  {
    "title": "Education",
    "subtitle": "News in Education & Learning",
    "imgURL": "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400",
  },
  {
    "title": "Travel",
    "subtitle": "Travel News & Destination Updates",
    "imgURL": "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400",
  },
  {
    "title": "Lifestyle",
    "subtitle": "Lifestyle Trends & News",
    "imgURL": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400",
  },
  {
    "title": "Food",
    "subtitle": "Food News & Culinary Insights",
    "imgURL": "https://images.unsplash.com/photo-1485962307416-993e145b0d0d?w=400",
  },
  {
    "title": "Environment",
    "subtitle": "Environmental News & Reports",
    "imgURL": "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400",
  },
  {
    "title": "Fashion",
    "subtitle": "Fashion Trends & News",
    "imgURL": "https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?w=400",
  },
  {
    "title": "Gaming",
    "subtitle": "Gaming News & Industry Updates",
    "imgURL": "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=400",
  },
];


