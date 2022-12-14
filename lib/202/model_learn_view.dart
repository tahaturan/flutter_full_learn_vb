import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: "a");
  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..userId = 1
      ..body = "vb";
    user1.title = "user1";

    final user2 = PostModel2(2, 3, "A", "b");
    user2.body = "body";

    final user3 = PostModel3(1, 2, "a", "b");
    // user3.body = "b";

    final user4 = PostModel4(userId: 1, id: 2, title: "a", body: "B");
    // user4.body = "A";

    final user5 = PostModel5(userId: 1, id: 2, title: "title", body: "body");
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: "title", body: "body");

    final user7 = PostModel7();

    final user8 = PostModel8(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(body: "tt");
            user9.updateBody("taha");
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? "Not has any data"),
      ),
      body: Container(),
    );
  }
}
