import 'package:dermain/Models/user_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersNotifier extends StateNotifier<List<UserModel>> {
  UsersNotifier() : super([]);

  void addUser(UserModel user) {
    state = [
      ...state,
      UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        password: user.password,
        password_confirmation: user.password_confirmation,
      ),
    ];
  }

  void addUsers(List<UserModel> users) {
    state = users;
  }
}

final usersProvider = StateNotifierProvider<UsersNotifier, List<UserModel>>(
    (ref) => UsersNotifier());
