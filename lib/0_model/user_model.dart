class UserModel{

  String? username;
  String? email;
  String? token;
  String? id;
  String? photoUrl;
  String? address;
  String? bio;
  String? about;
  String? phoneNumber;

  UserModel({
      this.username,
      this.email,
      this.token,
      this.photoUrl,
      this.address,
      this.bio,
      this.about,
      this.phoneNumber,
      this. id
      });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'token': token,
      'id':id,
      'photoUrl': photoUrl,
      'address': address,
      'bio': bio,
      'about': about,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'] ,
      token: map['token'] ,
      id:map['id'],
      photoUrl: map['photoUrl'] ,
      address: map['address'] ,
      bio: map['bio'] ,
      about: map['about'] ,
      phoneNumber: map['phoneNumber'],
    );
  }
}