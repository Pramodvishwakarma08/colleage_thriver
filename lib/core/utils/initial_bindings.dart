import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:colleage_thriver/core/app_export.dart';

import '../../data/data_sources/remote/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
