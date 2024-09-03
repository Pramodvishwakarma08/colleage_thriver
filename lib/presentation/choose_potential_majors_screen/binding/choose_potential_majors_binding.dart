import '../controller/choose_potential_majors_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChoosePotentialMajorsScreen.
///
/// This class ensures that the ChoosePotentialMajorsController is created when the
/// ChoosePotentialMajorsScreen is first loaded.
class ChoosePotentialMajorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoosePotentialMajorsController());
  }
}
