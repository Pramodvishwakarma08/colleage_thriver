import '../controller/take_sat_act_test_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TakeSatActTestScreen.
///
/// This class ensures that the TakeSatActTestController is created when the
/// TakeSatActTestScreen is first loaded.
class TakeSatActTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TakeSatActTestController());
  }
}
