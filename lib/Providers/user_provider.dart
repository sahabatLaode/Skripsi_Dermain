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
        // phone: user.phone,
        // nik: user.nik,
        // address: user.address,
        // birth: user.birth,
        // ranting: user.ranting,
        password: user.password,
        passwordConfirmation: user.passwordConfirmation,
      ),
    ];
  }

  void addUsers(List<UserModel> users) {
    state = users;
  }

  UserModel findUser(String? id) {
    UserModel tempUser = state.firstWhere((user) => user.id == id);

    return tempUser;
  }
}

final usersProvider = StateNotifierProvider<UsersNotifier, List<UserModel>>(
    (ref) => UsersNotifier());
