import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/progress_dialog_utils.dart';
import '../../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../../data/data_sources/remote/api_client.dart';
import '../../get_your_college_matches_screen/models/get_your_college_matches_model.dart';

/// A controller class for the GetYourCollegeMatchesThreeScreen.
///
/// This class manages the state of the GetYourCollegeMatchesThreeScreen, including the
/// current getYourCollegeMatchesThreeModelObj
class GetYourCollegeMatchesThreeController extends GetxController {
  List<DropdownMenuItem<String>> whereDoYouWantToAttendCollegeList1 = [
    const DropdownMenuItem(
      value: 'In State',
      child: Text('In State'),
    ),
    const DropdownMenuItem(
      value: 'New York',
      child: Text('New York'),
    ),
    const DropdownMenuItem(
      value: 'ghggff',
      child: Text('ghggff'),
    ),
    const DropdownMenuItem(
      value: 'Los Angeles',
      child: Text('Los Angeles'),
    ),
    const DropdownMenuItem(
      value: 'Chicago',
      child: Text('Chicago'),
    ),
    const DropdownMenuItem(
      value: 'Houston',
      child: Text('Houston'),
    ),
    const DropdownMenuItem(
      value: 'Phoenix',
      child: Text('Phoenix'),
    ),
    const DropdownMenuItem(
      value: 'Philadelphia',
      child: Text('Philadelphia'),
    ),
    const DropdownMenuItem(
      value: 'San Antonio',
      child: Text('San Antonio'),
    ),
  ];

  String? whereDoYouWantToAttendCollegeValue;

  TextEditingController SATcontroller = TextEditingController();
  TextEditingController ACTcontroller = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SATcontroller.addListener(() {
      if (SATcontroller.text.trim().contains('.') &&
          SATcontroller.text.trim().split('.')[1].length > 2) {
        // Only allow two decimal places
        SATcontroller.value = TextEditingValue(
          text: SATcontroller.text
              .trim()
              .substring(0, SATcontroller.text.trim().indexOf('.') + 3),
          selection: TextSelection.collapsed(
            offset: SATcontroller.text.trim().indexOf('.') + 3,
          ),
        );
      }
    });
    ACTcontroller.addListener(() {
      if (ACTcontroller.text.trim().contains('.') &&
          ACTcontroller.text.trim().split('.')[1].length > 2) {
        // Only allow two decimal places
        ACTcontroller.value = TextEditingValue(
          text: ACTcontroller.text
              .trim()
              .substring(0, ACTcontroller.text.trim().indexOf('.') + 3),
          selection: TextSelection.collapsed(
            offset: ACTcontroller.text.trim().indexOf('.') + 3,
          ),
        );
      }
    });
    getYourCollegeMatches();
  }

  @override
  void onClose() {
    super.onClose();
    SATcontroller.dispose();
    ACTcontroller.dispose();
  }

  RxBool isLoadingUpdateCollegeMatchOne = false.obs;

  Future<void> updateCollegeMatchesTwo() async {
    if (double.parse(SATcontroller.text.toString()) > 1600) {
      AppDialogUtils.showToast(message: "SAT should be 1600.0 or lower");
      return;
    }
    if (double.parse(ACTcontroller.text.toString()) > 36) {
      AppDialogUtils.showToast(message: "ACT should be 36.0 or lower");
      return;
    }

    isLoadingUpdateCollegeMatchOne(true);

    var data = {
      'college_location': '$whereDoYouWantToAttendCollegeValue',
      'sat_score': double.parse(SATcontroller.text.toString()).toString(),
      'act_score': double.parse(ACTcontroller.text.toString()).toString()
    };

    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.collegeMatchTwo, body: data);
      if (response.statusCode == 200) {
        isLoadingUpdateCollegeMatchOne(false);
        Get.toNamed(
          AppRoutes.getYourCollegeMatchesTwoScreen,
        );
        //  AppDialogUtils.showToast(message: '${response.data["message"]}');
      } else {
        isLoadingUpdateCollegeMatchOne.value = false;
      }
    } catch (e) {
      isLoadingUpdateCollegeMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  GetyourCollegeMatchesModel? getYourCollegeMatchesModel;
  RxBool isLoadingCollegeGetMatchOne = false.obs;

  Future<void> getYourCollegeMatches() async {
    isLoadingCollegeGetMatchOne(true);
    try {
      var response = await ApiClient().getRequest(
        endPoint: AppUrls.getCollegeMatchAll,
      );
      if (response.statusCode == 200) {
        whereDoYouWantToAttendCollegeValue =
            GetyourCollegeMatchesModel.fromJson(response.data)
                .allPoints![0]
                .collegeLocation;

        num? satScore = GetyourCollegeMatchesModel.fromJson(response.data)
            .allPoints![0]
            .satScore;
        if (satScore != null) {
          SATcontroller.text =
              GetyourCollegeMatchesModel.fromJson(response.data)
                  .allPoints![0]
                  .satScore
                  .toString();
        }

        num? actScore = GetyourCollegeMatchesModel.fromJson(response.data)
            .allPoints![0]
            .actScore;
        if (actScore != null) {
          ACTcontroller.text =
              GetyourCollegeMatchesModel.fromJson(response.data)
                  .allPoints![0]
                  .actScore
                  .toString();
        }

        isLoadingCollegeGetMatchOne.value = false;
      } else {
        isLoadingCollegeGetMatchOne.value = false;
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e, line) {
      // isLoadingCollegeGetMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      print("catch(e)==>$line");
    }
  }
}
