
class AllergyModel {
  final int id;
  final String title;
  final String image;

  AllergyModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory AllergyModel.fromJson(Map<String, dynamic> json) {
    return AllergyModel(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
  };
}
