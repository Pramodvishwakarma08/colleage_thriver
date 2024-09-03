import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/choose_the_right_college_screen/models/choose_the_right_college_model.dart';

import '../../home_screen/controller/home_screen_controller.dart';

/// A controller class for the ChooseTheRightCollegeScreen.
///
/// This class manages the state of the ChooseTheRightCollegeScreen, including the
/// current chooseTheRightCollegeModelObj
class ChooseTheRightCollegeController extends GetxController {
  Rx<ChooseTheRightCollegeModel> chooseTheRightCollegeModelObj = ChooseTheRightCollegeModel().obs;


  HomePageCollegeController controller =Get.put(HomePageCollegeController());


  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    print("onDelete222");
    controller.getProfile();
   return  super.onDelete;
  }
}
