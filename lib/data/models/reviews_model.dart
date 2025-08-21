import 'category_details_model.dart';

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
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class ReviewsModel {
  final int id;
  final String title;
  final String photo;
  final double rating;
  final int reviewsCount;
  final UserModel user;

  ReviewsModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
