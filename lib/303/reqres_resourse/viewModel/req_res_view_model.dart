import 'package:flutter_full_learn_vb/303/reqres_resourse/model/resource_model.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/service/reqres_service.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/view/req_res_view.dart';
import 'package:flutter_full_learn_vb/product/service/project_dio_mixin.dart';
import 'package:flutter_full_learn_vb/202/cache/loading_statefull.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resouces = [];

  @override
  void initState() {
    super.initState();

    reqresService = ReqresService(dioService);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resouces = (await reqresService.fetchResouceItem())?.data ?? [];
    changeLoading();
  }
}
