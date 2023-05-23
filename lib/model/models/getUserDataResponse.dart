class GetUserDataResponse {
  User? user;
  String? token;

  GetUserDataResponse({this.user, this.token});

  GetUserDataResponse.fromMap(Map<String, dynamic> json) {
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
  String? sId;
  String? name;
  String? email;
  String? profilePicture;
  int? iV;

  User({this.sId, this.name, this.email, this.profilePicture, this.iV});

  User.fromMap(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    iV = json['__v'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePicture'] = this.profilePicture;
    data['__v'] = this.iV;
    return data;
  }
}
