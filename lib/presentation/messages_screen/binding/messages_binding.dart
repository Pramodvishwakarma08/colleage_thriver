import '../controller/messages_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MessagesScreen.
///
/// This class ensures that the MessagesController is created when the
/// MessagesScreen is first loaded.
class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesController());
  }
}
