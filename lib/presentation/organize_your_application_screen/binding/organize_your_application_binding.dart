import '../controller/organize_your_application_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrganizeYourApplicationScreen.
///
/// This class ensures that the OrganizeYourApplicationController is created when the
/// OrganizeYourApplicationScreen is first loaded.
class OrganizeYourApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizeYourApplicationController());
  }
}
