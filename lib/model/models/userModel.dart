class UserModel {
  final String profilePics;
  final String name;
  final String email;
  final String uuid;
  final String token;

  UserModel(
      {required this.profilePics,
      required this.name,
      required this.email,
      required this.uuid,
      required this.token});

  factory UserModel.fromMap(Map<String, String> map) {
    return UserModel(
        profilePics: map['profilePics'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        uuid: map['uuid'] ?? '',
        token: map['token'] ?? '');
  }
}
