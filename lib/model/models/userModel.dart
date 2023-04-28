class UserModel {
  final String profilePics;
  final String name;
  final String email;
  final String uid;
  final String token;

  UserModel(
      {required this.profilePics,
      required this.name,
      required this.email,
      required this.uid,
      required this.token});

  UserModel copyWith(
      {String? email,
      String? name,
      String? uid,
      String? token,
      String? profilePics}) {
    return UserModel(
        profilePics: profilePics ?? '',
        name: name ?? '',
        email: email ?? '',
        uid: uid ?? '',
        token: token ?? '');
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        profilePics: map['profilePics'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        uid: map['uuid'] ?? '',
        token: map['token'] ?? '');
  }
}
