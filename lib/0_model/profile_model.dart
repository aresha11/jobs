

class ProfileModel {
  ProfileModel();


  ProfileModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    id = json['data']["id"];
    name = json['data']["name"];
    opt = json['data']["opt"];
    tow_step = json['data']["tow_step"];
    email = json['data']["email"];
    email_verified_at = json['data']["email_verified_at"];
    created_at = json['data']["created_at"];
    updated_at = json['data']["updated_at"];

  }
  bool? status;
  String? name;
  int? id;
  int? opt;
  String? tow_step;
  String? email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;


}