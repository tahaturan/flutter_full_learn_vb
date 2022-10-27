import '../../303/reqres_resourse/model/resource_model.dart';

class ResourceContext {
  ResouceModel? model;

  void saveModel(ResouceModel? model) {
    this.model = model;
  }

  void celar() {
    model = null;
  }
}
