class ReviewModel {
  final String id;
  final String name;
  final String role;
  final String company;
  final String comment;
  final double rating; // 1.0 - 5.0
  final String avatarUrl;
  final String date;
  final int order;

  ReviewModel({
    this.id = '',
    required this.name,
    this.role = '',
    this.company = '',
    required this.comment,
    this.rating = 5.0,
    this.avatarUrl = '',
    this.date = '',
    this.order = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'company': company,
      'comment': comment,
      'rating': rating,
      'avatarUrl': avatarUrl,
      'date': date,
      'order': order,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map, [String id = '']) {
    return ReviewModel(
      id: id,
      name: map['name'] as String? ?? '',
      role: map['role'] as String? ?? '',
      company: map['company'] as String? ?? '',
      comment: map['comment'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 5.0,
      avatarUrl: map['avatarUrl'] as String? ?? '',
      date: map['date'] as String? ?? '',
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }
}
