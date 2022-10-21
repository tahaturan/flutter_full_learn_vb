// ignore_for_file: avoid_print

class UserManagement {
  void sayName(GenericUser user) {
    print(user);
  }

  int calculateMoneys(List<GenericUser> users) {
    final sum = users.map((e) => e.money).fold<int>(0, (previousValue, element) => previousValue + element);

    return sum;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}
