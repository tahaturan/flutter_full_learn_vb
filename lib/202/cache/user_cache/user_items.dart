import 'package:flutter_full_learn_vb/202/cache/user_model.dart';

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User("vb", "10", "vb10.dev"),
      User("taha", "100", "vb10.dev"),
      User("taha2", "103", "vb10.dev"),
    ];
  }
}
