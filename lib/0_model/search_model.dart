/// status : true
/// data : [{"id":5,"name":"UI Designer","image":null,"job_time_type":"full","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T12:02:22.000000Z","updated_at":"2023-03-12T12:02:22.000000Z"},{"id":4,"name":"UI Designer","image":null,"job_time_type":"part","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:27:40.000000Z","updated_at":"2023-03-12T02:27:40.000000Z"},{"id":3,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:21:26.000000Z","updated_at":"2023-03-12T02:21:26.000000Z"},{"id":2,"name":"flutter","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-09T10:50:05.000000Z","updated_at":"2023-03-09T10:50:05.000000Z"},{"id":1,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":5,"expired":0,"created_at":"2023-03-09T10:42:37.000000Z","updated_at":"2023-03-12T12:04:40.000000Z"}]

class SearchModel {
  static var data=<Data>[];
  bool? status;


  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(  json:  element);
      data.add(item);
    });
  }






}



class Data {


  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;


}