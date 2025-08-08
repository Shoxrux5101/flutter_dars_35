class Onboarding2Model {
  final int id;
  final String title;
  final String image;

  Onboarding2Model({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Onboarding2Model.fromJson(Map<String, dynamic> json) {
    return Onboarding2Model(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
