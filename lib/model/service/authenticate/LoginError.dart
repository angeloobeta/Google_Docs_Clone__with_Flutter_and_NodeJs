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
