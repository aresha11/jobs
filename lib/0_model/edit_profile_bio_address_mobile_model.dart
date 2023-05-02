/// status : true
/// data : {"id":25,"user_id":25,"name":"ahmedyasser1","email":"aresha@gmail.com","mobile":"011111155","address":"tanta","language":null,"intersted_work":null,"offline_place":null,"remote_place":null,"bio":"sshs","education_id":null,"experience":null,"personal detailes":null,"created_at":"2023-03-10T14:06:01.000000Z","updated_at":"2023-03-14T13:39:58.000000Z"}

class EditProfileBioAddressMobileModel {
  bool? _status;
  static Data? data;

  EditProfileBioAddressMobileModel({
      bool? status, 
      Data? data,}){
    _status = status;
    data = data;
}

  EditProfileBioAddressMobileModel.fromJson(dynamic json) {
    _status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

// EditProfileBioAddressMobileModel copyWith({  bool? status,
//   Data? data,
// }) => EditProfileBioAddressMobileModel(  status: status ?? _status,
//   data: data ?? data,
// );
  // bool? get status => _status;
  // Data? get data => data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 25
/// user_id : 25
/// name : "ahmedyasser1"
/// email : "aresha@gmail.com"
/// mobile : "011111155"
/// address : "tanta"
/// language : null
/// intersted_work : null
/// offline_place : null
/// remote_place : null
/// bio : "sshs"
/// education_id : null
/// experience : null
/// personal detailes : null
/// created_at : "2023-03-10T14:06:01.000000Z"
/// updated_at : "2023-03-14T13:39:58.000000Z"

class Data {
  Data({
      num? id, 
      num? userId, 
      String? name, 
      String? email, 
      String? mobile, 
      String? address, 
      dynamic language, 
      dynamic interstedWork, 
      dynamic offlinePlace, 
      dynamic remotePlace, 
      String? bio, 
      dynamic educationId, 
      dynamic experience, 
      dynamic personaldetailes, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _address = address;
    _language = language;
    _interstedWork = interstedWork;
    _offlinePlace = offlinePlace;
    _remotePlace = remotePlace;
    _bio = bio;
    _educationId = educationId;
    _experience = experience;
    _personaldetailes = personaldetailes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _language = json['language'];
    _interstedWork = json['intersted_work'];
    _offlinePlace = json['offline_place'];
    _remotePlace = json['remote_place'];
    _bio = json['bio'];
    _educationId = json['education_id'];
    _experience = json['experience'];
    _personaldetailes = json['personal detailes'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _address;
  dynamic _language;
  dynamic _interstedWork;
  dynamic _offlinePlace;
  dynamic _remotePlace;
  String? _bio;
  dynamic _educationId;
  dynamic _experience;
  dynamic _personaldetailes;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? userId,
  String? name,
  String? email,
  String? mobile,
  String? address,
  dynamic language,
  dynamic interstedWork,
  dynamic offlinePlace,
  dynamic remotePlace,
  String? bio,
  dynamic educationId,
  dynamic experience,
  dynamic personaldetailes,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  language: language ?? _language,
  interstedWork: interstedWork ?? _interstedWork,
  offlinePlace: offlinePlace ?? _offlinePlace,
  remotePlace: remotePlace ?? _remotePlace,
  bio: bio ?? _bio,
  educationId: educationId ?? _educationId,
  experience: experience ?? _experience,
  personaldetailes: personaldetailes ?? _personaldetailes,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  dynamic get language => _language;
  dynamic get interstedWork => _interstedWork;
  dynamic get offlinePlace => _offlinePlace;
  dynamic get remotePlace => _remotePlace;
  String? get bio => _bio;
  dynamic get educationId => _educationId;
  dynamic get experience => _experience;
  dynamic get personaldetailes => _personaldetailes;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['language'] = _language;
    map['intersted_work'] = _interstedWork;
    map['offline_place'] = _offlinePlace;
    map['remote_place'] = _remotePlace;
    map['bio'] = _bio;
    map['education_id'] = _educationId;
    map['experience'] = _experience;
    map['personal detailes'] = _personaldetailes;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}