class UserModel {
  final String id;
  final String name;
  final String email;

  // final String phone;
  // final String birth;
  // final String nik;
  // final String address;
  // final String ranting;
  final String password;
  final String passwordConfirmation;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    // required this.phone,
    // required this.birth,
    // required this.nik,
    // required this.address,
    // required this.ranting,
    required this.password,
    required this.passwordConfirmation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'name': String name,
      'email': String email,
      'password': String password,
      'passwordConfirmation': String passwordConfirmation,
      } =>
          UserModel(
            id: id,
            name: name,
            email: email,
            password: password,
            passwordConfirmation: passwordConfirmation,
          ),
      _ => throw const FormatException('Failed to load user model.'),
    };
  }
}

// ===== Lama
// factory UserModel.fromJson(Map<String, dynamic> json) {
//   return UserModel(
//     id: json['id'],
//     name: json['name'],
//     email: json['email'],
//     // phone: json['phone'],
//     // birth: json['birth'],
//     // nik: json['nik'],
//     // address: json['address'],
//     // ranting: json['ranting'],
//     password: json['password'],
//     passwordConfirmation: json['passwordConfirmation'],
//   );
// }
// }
