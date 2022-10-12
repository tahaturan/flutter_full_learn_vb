// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/service/post_model.dart';

import 'comment_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel model, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<PostCommetModel>?> fetchReleatedCCommentWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;

  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePath.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel model, int id) async {
    try {
      final response = await _dio.put("${_PostServicePath.posts.name}/$id", data: model);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete("${_PostServicePath.posts.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return null;
  }

  @override
  Future<List<PostCommetModel>?> fetchReleatedCCommentWithPostId(int postId) async {
    try {
      final response =
          await _dio.get(_PostServicePath.comments.name, queryParameters: {_PostQueryPath.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostCommetModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }

enum _PostQueryPath { postId }

class _ShowDebug {
  static void showDioError(DioError error) {
    debugPrint(error.message);
  }
}
