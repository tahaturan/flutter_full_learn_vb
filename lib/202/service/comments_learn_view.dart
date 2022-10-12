import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/service/comment_model.dart';
import 'package:flutter_full_learn_vb/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, required this.postId});

  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;

  List<PostCommetModel>? _commentsItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _chanceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<List<PostCommetModel>?> fetchItemsWithId(int postId) async {
    _chanceLoading();
    return _commentsItem = await postService.fetchReleatedCCommentWithPostId(postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<PostCommetModel>?>(
        future: fetchItemsWithId(widget.postId ?? 0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: _commentsItem?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(_commentsItem?[index].email ?? ""),
              );
            },
          );
        },
      ),
    );
  }
}
