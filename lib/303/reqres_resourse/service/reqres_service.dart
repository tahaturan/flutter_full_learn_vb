import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResouceModel?> fetchResouceItem();
}

enum ReqresPath { unknown }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResouceModel?> fetchResouceItem() async {
    final response = await dio.get('/${ReqresPath.unknown.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is Map<String, dynamic>) {
        return ResouceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
