class CategoryDetailsModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String photo;
  final String videoRecipe;
  final int timeRequired;
  final int rating;
  final int reviewsCount;
  final String difficulty;
  final UserModel user;
  final List<InstructionModel> instructions;
  final List<IngredientModel> ingredients;

  CategoryDetailsModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.difficulty,
    required this.user,
    required this.instructions,
    required this.ingredients,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? "",
      description: json['description']?.toString() ?? "",
      photo: json['photo']?.toString() ?? "",
      videoRecipe: json['videoRecipe']?.toString() ?? "",
      timeRequired: (json['timeRequired'] as num?)?.toInt() ?? 0,
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      difficulty: json['difficulty']?.toString() ?? "",
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((e) => InstructionModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class UserModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class InstructionModel {
  final String text;
  final int order;

  InstructionModel({
    required this.text,
    required this.order,
  });

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      text: json['text'],
      order: json['order'],
    );
  }
}
class IngredientModel {
  final String amount;
  final String name;
  final int order;

  IngredientModel({
    required this.amount,
    required this.name,
    required this.order,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      amount: json['amount'],
      name: json['name'],
      order: json['order'],
    );
  }
}
