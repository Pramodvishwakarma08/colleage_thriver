import '../controller/create_a_shortlist_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAShortlistScreen.
///
/// This class ensures that the CreateAShortlistController is created when the
/// CreateAShortlistScreen is first loaded.
class CreateAShortlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAShortlistController());
  }
}
