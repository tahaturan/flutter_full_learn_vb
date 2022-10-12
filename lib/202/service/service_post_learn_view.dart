import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/service/post_model.dart';
import 'package:flutter_full_learn_vb/product/language/language_items.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _chanceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _chanceLoading();
    final response = await _dio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = "Basarili";
      print(name);
    }
    _chanceLoading();
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
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "title"),
          ),
          TextField(
            controller: _bodyController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "Body"),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.creditCardNumber],
            decoration: const InputDecoration(labelText: "UserId"),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));

                        _addItemToService(model);
                      }
                    },
              child: const Text("Send Text")),
        ],
      ),
    );
  }
}
