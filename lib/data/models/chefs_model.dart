class ChefsModel {
  final int id;
  final String profilePhoto;
  final String userName;
  final String firstName;
  final String lastName;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  ChefsModel({
    required this.id,
    required this.firstName,
    required this.followerCount,
    required this.followingCount,
    required this.lastName,
    required this.presentation,
    required this.profilePhoto,
    required this.recipesCount,
    required this.userName,
  });

  factory ChefsModel.fromJson(Map<String, dynamic> json) {
    return ChefsModel(
      id: json['id'],
      firstName: json['firstName'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      profilePhoto: json['profilePhoto'],
      recipesCount: json['recipesCount'],
      userName: json['username'],
    );
  }
}
