import 'dart:convert';

import 'package:flutter_full_learn_vb/202/cache/shared_manager.dart';

import '../user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    final _items = items.map((element) => jsonEncode(element.toJson())).toList();

    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringItems(SharedKeys.users);

    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
