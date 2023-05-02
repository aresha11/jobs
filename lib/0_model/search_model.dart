/// status : true
/// data : [{"id":5,"name":"UI Designer","image":null,"job_time_type":"full","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T12:02:22.000000Z","updated_at":"2023-03-12T12:02:22.000000Z"},{"id":4,"name":"UI Designer","image":null,"job_time_type":"part","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:27:40.000000Z","updated_at":"2023-03-12T02:27:40.000000Z"},{"id":3,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:21:26.000000Z","updated_at":"2023-03-12T02:21:26.000000Z"},{"id":2,"name":"flutter","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-09T10:50:05.000000Z","updated_at":"2023-03-09T10:50:05.000000Z"},{"id":1,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":5,"expired":0,"created_at":"2023-03-09T10:42:37.000000Z","updated_at":"2023-03-12T12:04:40.000000Z"}]

class SearchModel {
  static List<Data>? data;
  SearchModel({
    bool? status,
    List<Data>? data,}){
    _status = status;
    data = data;
  }

  SearchModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;

  // SuggestedJobsModel copyWith({  bool? status,
  //   List<Data>? data,
  // }) => SuggestedJobsModel(  status: status ?? _status,
  //   data: data ?? data,
  // );


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Data {
  Data({
    num? id,
    String? name,
    dynamic image,
    String? jobTimeType,
    String? jobType,
    String? jobLevel,
    String? jobDescription,
    String? jobSkill,
    String? compName,
    String? compEmail,
    String? compWebsite,
    String? aboutComp,
    String? location,
    String? salary,
    num? favorites,
    num? expired,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _jobTimeType = jobTimeType;
    _jobType = jobType;
    _jobLevel = jobLevel;
    _jobDescription = jobDescription;
    _jobSkill = jobSkill;
    _compName = compName;
    _compEmail = compEmail;
    _compWebsite = compWebsite;
    _aboutComp = aboutComp;
    _location = location;
    _salary = salary;
    _favorites = favorites;
    _expired = expired;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _jobTimeType = json['job_time_type'];
    _jobType = json['job_type'];
    _jobLevel = json['job_level'];
    _jobDescription = json['job_description'];
    _jobSkill = json['job_skill'];
    _compName = json['comp_name'];
    _compEmail = json['comp_email'];
    _compWebsite = json['comp_website'];
    _aboutComp = json['about_comp'];
    _location = json['location'];
    _salary = json['salary'];
    _favorites = json['favorites'];
    _expired = json['expired'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _jobTimeType;
  String? _jobType;
  String? _jobLevel;
  String? _jobDescription;
  String? _jobSkill;
  String? _compName;
  String? _compEmail;
  String? _compWebsite;
  String? _aboutComp;
  String? _location;
  String? _salary;
  num? _favorites;
  num? _expired;
  String? _createdAt;
  String? _updatedAt;
  Data copyWith({  num? id,
    String? name,
    dynamic image,
    String? jobTimeType,
    String? jobType,
    String? jobLevel,
    String? jobDescription,
    String? jobSkill,
    String? compName,
    String? compEmail,
    String? compWebsite,
    String? aboutComp,
    String? location,
    String? salary,
    num? favorites,
    num? expired,
    String? createdAt,
    String? updatedAt,
  }) => Data(  id: id ?? _id,
    name: name ?? _name,
    image: image ?? _image,
    jobTimeType: jobTimeType ?? _jobTimeType,
    jobType: jobType ?? _jobType,
    jobLevel: jobLevel ?? _jobLevel,
    jobDescription: jobDescription ?? _jobDescription,
    jobSkill: jobSkill ?? _jobSkill,
    compName: compName ?? _compName,
    compEmail: compEmail ?? _compEmail,
    compWebsite: compWebsite ?? _compWebsite,
    aboutComp: aboutComp ?? _aboutComp,
    location: location ?? _location,
    salary: salary ?? _salary,
    favorites: favorites ?? _favorites,
    expired: expired ?? _expired,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get jobTimeType => _jobTimeType;
  String? get jobType => _jobType;
  String? get jobLevel => _jobLevel;
  String? get jobDescription => _jobDescription;
  String? get jobSkill => _jobSkill;
  String? get compName => _compName;
  String? get compEmail => _compEmail;
  String? get compWebsite => _compWebsite;
  String? get aboutComp => _aboutComp;
  String? get location => _location;
  String? get salary => _salary;
  num? get favorites => _favorites;
  num? get expired => _expired;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['job_time_type'] = _jobTimeType;
    map['job_type'] = _jobType;
    map['job_level'] = _jobLevel;
    map['job_description'] = _jobDescription;
    map['job_skill'] = _jobSkill;
    map['comp_name'] = _compName;
    map['comp_email'] = _compEmail;
    map['comp_website'] = _compWebsite;
    map['about_comp'] = _aboutComp;
    map['location'] = _location;
    map['salary'] = _salary;
    map['favorites'] = _favorites;
    map['expired'] = _expired;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}