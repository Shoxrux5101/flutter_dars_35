class FollowingModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePhoto;

  FollowingModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory FollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowingModel(
      id: json['id'] as int,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePhoto: json['profilePhoto'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'profilePhoto': profilePhoto,
    };
  }
}
