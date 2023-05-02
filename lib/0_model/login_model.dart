class LoginModel {
  String? id;
  String? status;
  static String? accessToken;

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];
    status = json['status'];
    accessToken = json['token'];
  }
}