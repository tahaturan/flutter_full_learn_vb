import 'package:flutter_full_learn_vb/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("User Calculate ", () {
    final users = [
      GenericUser('taha', '1', 10),
      GenericUser('taha', '1', 10),
      GenericUser('taha', '1', 20),
    ];

    final result = UserManagement().calculateMoneys(users);

    expect(result, 40);
  });
}
