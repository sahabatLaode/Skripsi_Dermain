class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String password_confirmation;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.password_confirmation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      password_confirmation: json['password_confirmation'],
    );
  }
}
