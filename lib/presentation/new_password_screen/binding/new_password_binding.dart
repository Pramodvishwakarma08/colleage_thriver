import '../controller/new_password_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NewPasswordScreen.
///
/// This class ensures that the NewPasswordController is created when the
/// NewPasswordScreen is first loaded.
class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController());
  }
}
