import '../controller/congratulations_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CongratulationsScreen.
///
/// This class ensures that the CongratulationsController is created when the
/// CongratulationsScreen is first loaded.
class CongratulationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CongratulationsController());
  }
}
