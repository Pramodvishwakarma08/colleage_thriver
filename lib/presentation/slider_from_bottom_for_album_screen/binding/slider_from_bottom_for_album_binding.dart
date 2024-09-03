import '../controller/slider_from_bottom_for_album_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SliderFromBottomForAlbumScreen.
///
/// This class ensures that the SliderFromBottomForAlbumController is created when the
/// SliderFromBottomForAlbumScreen is first loaded.
class SliderFromBottomForAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SliderFromBottomForAlbumController());
  }
}
