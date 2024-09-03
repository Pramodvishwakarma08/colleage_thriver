import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/mentors_screen/models/mentors_model.dart';

import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';

class MentorsController extends GetxController {
  Rx<MentorsModel> mentorsModelObj = MentorsModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  onSelected(dynamic value) {
    for (var element in mentorsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    mentorsModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in mentorsModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    mentorsModelObj.value.dropdownItemList1.refresh();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMentors();
  }



  RxBool isLoading =false.obs;
  MentorModel mentorModel=MentorModel();

  Future<void> getMentors() async {
    isLoading.value = true;

    try {
      var response = await ApiClient().getRequest(endPoint: AppUrls.getMentors);
      if (response.statusCode == 200) {

        mentorModel =  MentorModel.fromJson(response.data);
        isLoading.value = false;

      } else {

      }
    } catch (e, log) {
      print("object${e.toString()}");
      print("object${log}");
    }
  }


}

