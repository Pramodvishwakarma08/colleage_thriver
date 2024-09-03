import '../controller/rewards_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RewardsScreen.
///
/// This class ensures that the RewardsController is created when the
/// RewardsScreen is first loaded.
class RewardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardsController());
  }
}
