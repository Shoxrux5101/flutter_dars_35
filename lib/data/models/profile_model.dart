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
      profilePhoto: json['profilePhoto'] ?? json['profile_photo'] ?? '',
      username: json['username'] ?? '',
      firstName: json['firstName'] ?? json['first_name'] ?? '',
      lastName: json['lastName'] ?? json['last_name'] ?? '',
      presentation: json['presentation'] ?? '',
      recipesCount: json['recipesCount'] ?? json['recipes_count'] ?? 0,
      followingCount: json['followingCount'] ?? json['following_count'] ?? 0,
      followerCount: json['followerCount'] ?? json['follower_count'] ?? 0,
    );
  }
}