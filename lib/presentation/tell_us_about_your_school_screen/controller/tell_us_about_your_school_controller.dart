import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../home_screen/controller/home_screen_controller.dart';
import '../../tell_us_about_yourself_screen/models/view_profile_model.dart';

class TellUsAboutYourSchoolController extends GetxController {
  TextEditingController highSchoolName = TextEditingController();
  TextEditingController gPA = TextEditingController();
  TextEditingController selectGroup = TextEditingController();
  String? yearInSchool;

  String? highSchoolGraduationYear;

  String? highSchoolGraduationMonth;

  List<String> monthsList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> dropdownYearList = [
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',


  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
    gPA.addListener(() {
      if (gPA.text.trim().contains('.') &&
          gPA.text.trim().split('.')[1].length > 2) {
        // Only allow two decimal places
        gPA.value = TextEditingValue(
          text: gPA.text.trim().substring(0, gPA.text.trim().indexOf('.') + 3),
          selection: TextSelection.collapsed(
            offset: gPA.text.trim().indexOf('.') + 3,
          ),
        );
      }
    });
  }

  HomePageCollegeController controller =Get.put(HomePageCollegeController());

  @override
  void onClose() {
    super.onClose();
    highSchoolName.dispose();
    print("nameController.dispose()");
    gPA.dispose();
    controller.getProfile();
  }

  RxBool isLoading = false.obs;
  ViewProfileModel? viewProfileModel;

  Future<void> getProfile() async {
    isLoading(true);
    try {
      var response = await ApiClient().getRequest(
        endPoint: AppUrls.viewProfile,
      );
      if (response.statusCode == 200) {
        highSchoolName.text =
            ViewProfileModel.fromJson(response.data).data![0].hghSclName ?? "";
        gPA.text =
            "${ViewProfileModel.fromJson(response.data).data![0].gpa ?? ""}";
        int? year2 =
            ViewProfileModel.fromJson(response.data).data![0].graduationYear;
        highSchoolGraduationYear = year2 == null ? null : year2.toString();
        // highSchoolGraduationYear= "${ViewProfileModel.fromJson(response.data).data![0].graduationYear ?? ""}";
        highSchoolGraduationMonth =
            ViewProfileModel.fromJson(response.data).data![0].graduationMonth;
        int? year =
            ViewProfileModel.fromJson(response.data).data![0].schoolYear;
        yearInSchool = year == null ? null : year.toString();
        selectGroup.text = ViewProfileModel.fromJson(response.data)
                .data![0]
                .groupAffiliation ??
            "";

        isLoading(false);
      } else {
        isLoading.value = false;
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e) {
      // isLoading.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  RxBool isLoadingUpdateProfile = false.obs;

  Future<void> updateProfile() async {
    isLoadingUpdateProfile(true);
    await Future.delayed(Duration(seconds: 4));

    var data = {
      'hgh_scl_name': '${highSchoolName.text}',
      'school_year': '$yearInSchool',
      'gpa': double.parse(gPA.text.toString()).toString(),
      'group_affiliation': '${selectGroup.text}',
      'graduation_month': '$highSchoolGraduationMonth',
      'graduation_year': '$highSchoolGraduationYear'
    };
    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.updateProfile, body: data);
      if (response.statusCode == 200) {
        isLoadingUpdateProfile(false);
        Get.toNamed(
          AppRoutes.tellUsAboutYourSchoolScreen,
        );
        AppDialogUtils.showToast(message: '${response.data["message"]}');
      } else {}
    } catch (e) {
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }
}
