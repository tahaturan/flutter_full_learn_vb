// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/service/comments_learn_view.dart';
import 'package:flutter_full_learn_vb/202/service/post_model.dart';
import 'package:flutter_full_learn_vb/202/service/post_service.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  late final Dio _dio;
  bool _isLoading = false;
  List<PostModel>? _items;
//* TEST edilebilir kod basladi
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  Future<void> fetchPostItems() async {
    _chanceLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _chanceLoading();
  }

  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    _chanceLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _chanceLoading();
    return null;
  }

  void _chanceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.serviceLearnApparTitle),
        actions: [
          Center(
            child: _isLoading ? const CircularProgressIndicator.adaptive() : Container(),
          )
        ],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(model: _items?[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {},
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
        leading: Text(_model?.id.toString() ?? ""),
        trailing: Text(_model?.userId.toString() ?? ""),
      ),
    );
  }
}
