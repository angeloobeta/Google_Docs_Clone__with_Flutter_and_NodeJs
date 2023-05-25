class LoginResponse {
  User? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromMap(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromMap(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toMap();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? Id;
  String? name;
  String? email;
  String? profilePicture;
  int? iV;

  User({this.Id, this.name, this.email, this.profilePicture, this.iV});

  User.fromMap(Map<String, dynamic> json) {
    Id = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    iV = json['__v'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.Id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePicture'] = this.profilePicture;
    data['__v'] = this.iV;
    return data;
  }
}

class LoginError {
  String? error;

  LoginError({required this.error});

  LoginError.fromMap(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}
