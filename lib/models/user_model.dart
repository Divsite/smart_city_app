// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? username;
  String? email;
  String? password;
  String? ic_number;
  String? phone_number;
  String? ministry;
  String? department;
  String? division;
  String? role;
  String? branch_id;

  UserModel(
      {this.username,
      this.email,
      this.password,
      this.ic_number,
      this.phone_number,
      this.ministry,
      this.department,
      this.division,
      this.role,
      this.branch_id});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    ic_number = json['ic_number'];
    phone_number = json['phone_number'];
    ministry = json['ministry'];
    department = json['department'];
    division = json['division'];
    role = json['role'];
    branch_id = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'ic_number': ic_number,
      'phone_number': phone_number,
      'ministry': ministry,
      'department': department,
      'division': division,
      'role': role,
      'branch_id' : branch_id
    };
  }
}
