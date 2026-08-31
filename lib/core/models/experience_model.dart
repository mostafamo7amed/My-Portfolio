class ExperienceModel {
  final String id;
  final String title;
  final String company;
  final String description;
  final String type;
  final String duration;
  final String image;
  final String location;
  final int order;

  ExperienceModel({
    this.id = '',
    required this.title,
    this.company = '',
    required this.description,
    required this.image,
    required this.type,
    required this.duration,
    this.location = '',
    this.order = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'company': company,
      'description': description,
      'image': image,
      'type': type,
      'duration': duration,
      'location': location,
      'order': order,
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map, [String id = '']) {
    return ExperienceModel(
      id: id,
      title: map['title'] as String? ?? '',
      company: map['company'] as String? ?? '',
      description: map['description'] as String? ?? '',
      image: map['image'] as String? ?? '',
      type: map['type'] as String? ?? '',
      duration: map['duration'] as String? ?? '',
      location: map['location'] as String? ?? '',
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }
}
