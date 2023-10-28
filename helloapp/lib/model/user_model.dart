class UserModal {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? profilepic;

  UserModal({this.uid, this.name, this.email, this.password, this.profilepic});

  // receiving data from server
  factory UserModal.fromMap(map) {
    return UserModal(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      profilepic: map['profilepic'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'profilepic': profilepic,
    };
  }
}
