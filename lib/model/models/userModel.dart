// class UserModel {
//   final String profilePics;
//   final String name;
//   final String email;
//   final String uid;
//   final String token;
//
//   UserModel(
//       {required this.profilePics,
//       required this.name,
//       required this.email,
//       required this.uid,
//       required this.token});
//
//   UserModel copyWith(
//       {String? email,
//       String? name,
//       String? uid,
//       String? token,
//       String? profilePics}) {
//     return UserModel(
//         profilePics: profilePics ?? '',
//         name: name ?? '',
//         email: email ?? '',
//         uid: uid ?? '',
//         token: token ?? '');
//   }
//
//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//         profilePics: map['profilePics'] ?? '',
//         name: map['name'] ?? '',
//         email: map['email'] ?? '',
//         uid: map['uuid'] ?? '',
//         token: map['token'] ?? '');
//   }
// }

class CreateAccountResponse {
  User? user;
  String? token;

  CreateAccountResponse({this.user, this.token});

  CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? profilePicture;
  String? sId;
  int? iV;

  User({this.name, this.email, this.profilePicture, this.sId, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePicture'] = this.profilePicture;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class CreateAccountErrorResponse {
  String? error;

  CreateAccountErrorResponse({this.error});

  CreateAccountErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}
