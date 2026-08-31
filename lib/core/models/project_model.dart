class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final String link; // General link or primary URL
  final String appStoreLink;
  final String playStoreLink;
  final String githubLink;
  final String demoLink;
  final List<String> tags;
  final String dateRange;
  final int order;

  ProjectModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.image,
    this.link = '',
    this.appStoreLink = '',
    this.playStoreLink = '',
    this.githubLink = '',
    this.demoLink = '',
    required this.tags,
    this.dateRange = '',
    this.order = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'link': link,
      'appStoreLink': appStoreLink,
      'playStoreLink': playStoreLink,
      'githubLink': githubLink,
      'demoLink': demoLink,
      'tags': tags,
      'dateRange': dateRange,
      'order': order,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map, [String id = '']) {
    return ProjectModel(
      id: id,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      image: map['image'] as String? ?? '',
      link: map['link'] as String? ?? '',
      appStoreLink: map['appStoreLink'] as String? ?? '',
      playStoreLink: map['playStoreLink'] as String? ?? '',
      githubLink: map['githubLink'] as String? ?? '',
      demoLink: map['demoLink'] as String? ?? '',
      tags: (map['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      dateRange: map['dateRange'] as String? ?? '',
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }
}
