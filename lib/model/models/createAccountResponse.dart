class CreateAccountResponse {
  final String profilePics;
  final String name;
  final String email;
  final String uuid;
  final String token;

  CreateAccountResponse(
      {required this.profilePics,
      required this.name,
      required this.email,
      required this.uuid,
      required this.token});

  factory CreateAccountResponse.fromMap(Map<String, dynamic> map) {
    return CreateAccountResponse(
        profilePics: map['profilePics'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        uuid: map['uuid'] ?? '',
        token: map['token'] ?? '');
  }
}
