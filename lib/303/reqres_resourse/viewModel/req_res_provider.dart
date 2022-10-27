import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/service/reqres_service.dart';
import 'package:flutter_full_learn_vb/product/global/resoruce_context.dart';

import '../model/resource_model.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resouces = [];

  bool isLoading = false;

  void _chanceLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _chanceLoading();
    resouces = (await reqresService.fetchResouceItem())?.data ?? [];
    _chanceLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResouceModel(data: resouces));
  }
}
