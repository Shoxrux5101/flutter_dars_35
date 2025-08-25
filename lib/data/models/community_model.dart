class CommunityModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final double rating;
  final int reviewsCount;
  final DateTime created;
  final User user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      photo: json['photo'] ?? "",
      timeRequired: json['timeRequired'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviewsCount'] ?? 0,
      created: DateTime.parse(json['created']),
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      profilePhoto: json['profilePhoto'] ?? "",
      username: json['username'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
    );
  }
}
