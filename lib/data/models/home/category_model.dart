
class CategoryModel {
  final String image;
  final String title;
  final int id;

  CategoryModel({
    required this.image,
    required this.title,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      image: json['image'],
      title: json['title'],
      id: json['id'],
    );
  }
}
