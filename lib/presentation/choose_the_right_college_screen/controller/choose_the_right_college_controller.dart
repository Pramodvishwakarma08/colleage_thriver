import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/choose_the_right_college_screen/models/choose_the_right_college_model.dart';

import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../home_screen/controller/home_screen_controller.dart';
import '../../tell_us_about_yourself_screen/models/view_profile_model.dart';

/// A controller class for the ChooseTheRightCollegeScreen.
///
/// This class manages the state of the ChooseTheRightCollegeScreen, including the
/// current chooseTheRightCollegeModelObj
class ChooseTheRightCollegeController extends GetxController {
  Rx<ChooseTheRightCollegeModel> chooseTheRightCollegeModelObj = ChooseTheRightCollegeModel().obs;
  HomePageCollegeController controller =Get.put(HomePageCollegeController());




}
