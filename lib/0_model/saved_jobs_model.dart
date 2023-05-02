/// status : true
/// data : [{"id":49,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-24T22:43:47.000000Z","updated_at":"2023-03-24T22:43:47.000000Z"},{"id":36,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-23T22:32:29.000000Z","updated_at":"2023-03-23T22:32:29.000000Z"},{"id":35,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-23T22:31:37.000000Z","updated_at":"2023-03-23T22:31:37.000000Z"},{"id":34,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-23T22:31:13.000000Z","updated_at":"2023-03-23T22:31:13.000000Z"},{"id":33,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-23T22:30:39.000000Z","updated_at":"2023-03-23T22:30:39.000000Z"},{"id":32,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-23T21:48:20.000000Z","updated_at":"2023-03-23T21:48:20.000000Z"},{"id":11,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-18T21:32:08.000000Z","updated_at":"2023-03-18T21:32:08.000000Z"},{"id":10,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-18T21:31:44.000000Z","updated_at":"2023-03-18T21:31:44.000000Z"},{"id":9,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-18T21:30:47.000000Z","updated_at":"2023-03-18T21:30:47.000000Z"},{"id":8,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-18T14:36:10.000000Z","updated_at":"2023-03-18T14:36:10.000000Z"},{"id":7,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-17T16:04:03.000000Z","updated_at":"2023-03-17T16:04:03.000000Z"},{"id":6,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-16T18:39:46.000000Z","updated_at":"2023-03-16T18:39:46.000000Z"},{"id":5,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-12T12:04:40.000000Z","updated_at":"2023-03-12T12:04:40.000000Z"},{"id":4,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-09T10:50:12.000000Z","updated_at":"2023-03-09T10:50:12.000000Z"},{"id":3,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-09T10:49:10.000000Z","updated_at":"2023-03-09T10:49:10.000000Z"},{"id":2,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-09T10:46:21.000000Z","updated_at":"2023-03-09T10:46:21.000000Z"},{"id":1,"user_id":1,"like":1,"job_id":1,"image":null,"name":"amit","location":"hsjsdhsjhsjd","created_at":"2023-03-09T10:45:19.000000Z","updated_at":"2023-03-09T10:45:19.000000Z"}]

class SavedJobs {
  bool? _status;
 static var data=<Data>[];
  SavedJobs({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    data = data;
}

  SavedJobs.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

// SavedJobs copyWith({  bool? status,
//   List<Data>? data,
// }) => SavedJobs(  status: status ?? _status,
//   data: data ?? _data,
// );
//   bool? get status => _status;
//   List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 49
/// user_id : 1
/// like : 1
/// job_id : 1
/// image : null
/// name : "amit"
/// location : "hsjsdhsjhsjd"
/// created_at : "2023-03-24T22:43:47.000000Z"
/// updated_at : "2023-03-24T22:43:47.000000Z"

class Data {
  Data({
      num? id, 
      num? userId, 
      num? like, 
      num? jobId, 
      dynamic image, 
      String? name, 
      String? location, 
      String? createdAt, 
      String? updatedAt,}){
    id = id;
    userId = userId;
    like = like;
    jobId = jobId;
    image = image;
    name = name;
    location = location;
    createdAt = createdAt;
    updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    like = json['like'];
    jobId = json['job_id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  num? like;
  num? jobId;
  dynamic image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;

// Data copyWith({  num? id,
//   num? userId,
//   num? like,
//   num? jobId,
//   dynamic image,
//   String? name,
//   String? location,
//   String? createdAt,
//   String? updatedAt,
// }) => Data(  id: id ?? _id,
//   userId: userId ?? _userId,
//   like: like ?? _like,
//   jobId: jobId ?? _jobId,
//   image: image ?? _image,
//   name: name ?? _name,
//   location: location ?? _location,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
// );
//   num? get id => _id;
//   num? get userId => _userId;
//   num? get like => _like;
//   num? get jobId => _jobId;
//   dynamic get image => _image;
//   String? get name => _name;
//   String? get location => _location;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['like'] = like;
    map['job_id'] = jobId;
    map['image'] = image;
    map['name'] = name;
    map['location'] = location;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}