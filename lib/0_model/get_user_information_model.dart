class GetUserInformationModel {
  GetUserInformationModel();

  GetUserInformationModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    towStep = json['tow_step'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? otp;
  dynamic towStep;
  String?email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;


}