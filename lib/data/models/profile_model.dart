class ProfileModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  ProfileModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      profilePhoto: json['profilePhoto'] ?? '',
      username: json['username'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      presentation: json['presentation'] ?? '',
      recipesCount: json['recipesCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      followerCount: json['followerCount'] ?? 0,
    );
  }
}