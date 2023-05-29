/// status : true
/// data : [{"id":34,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:31:10.000000Z","updated_at":"2023-03-20T12:31:10.000000Z"},{"id":33,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:15:41.000000Z","updated_at":"2023-03-20T12:15:41.000000Z"},{"id":32,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"company","created_at":"2023-03-20T12:05:21.000000Z","updated_at":"2023-03-20T12:05:21.000000Z"},{"id":31,"massage":"hello","user_id":25,"comp_id":1,"sender_user":"user","created_at":"2023-03-20T12:03:24.000000Z","updated_at":"2023-03-20T12:03:24.000000Z"}]


class ChatModel {
  bool? status;

  static var data = <Data>[];
  ChatModel();
  ChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    });


  }

}

class Data {
  int? id;
  String? massage;
  int? user_id;
  int? comp_id;
  String?senderUser;
  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    massage = json['massage'];
    comp_id = json['comp_id'];
    senderUser = json['sender_user'];
  }
}


