/// status : true
/// data : [{"id":34,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:31:10.000000Z","updated_at":"2023-03-20T12:31:10.000000Z"},{"id":33,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:15:41.000000Z","updated_at":"2023-03-20T12:15:41.000000Z"},{"id":32,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"company","created_at":"2023-03-20T12:05:21.000000Z","updated_at":"2023-03-20T12:05:21.000000Z"},{"id":31,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:03:24.000000Z","updated_at":"2023-03-20T12:03:24.000000Z"}]

class ChatModel {
  bool? _status;
  static List<Data>? data;
  ChatModel({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    data = data;
}

  ChatModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

// ChatModel copyWith({  bool? status,
//   List<Data>? data,
// }) => ChatModel(  status: status ?? _status,
//   data: data ?? _data,
// );
//   bool? get status => _status;
//   List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 34
/// massage : "hello"
/// user_id : 25
/// comp_id : 1
/// sender_user : "user"
/// created_at : "2023-03-20T12:31:10.000000Z"
/// updated_at : "2023-03-20T12:31:10.000000Z"

class Data {
  Data({
      num? id, 
      String? massage, 
      num? userId, 
      num? compId, 
      String? senderUser, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _massage = massage;
    _userId = userId;
    _compId = compId;
    _senderUser = senderUser;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _massage = json['massage'];
    _userId = json['user_id'];
    _compId = json['comp_id'];
    _senderUser = json['sender_user'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _massage;
  num? _userId;
  num? _compId;
  String? _senderUser;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? massage,
  num? userId,
  num? compId,
  String? senderUser,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  massage: massage ?? _massage,
  userId: userId ?? _userId,
  compId: compId ?? _compId,
  senderUser: senderUser ?? _senderUser,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get massage => _massage;
  num? get userId => _userId;
  num? get compId => _compId;
  String? get senderUser => _senderUser;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['massage'] = _massage;
    map['user_id'] = _userId;
    map['comp_id'] = _compId;
    map['sender_user'] = _senderUser;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}