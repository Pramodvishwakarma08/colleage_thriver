// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../models/view_profile_model.dart';

String? gobalSelected;

class TellUsAboutYourselfController extends GetxController {
  HomePageCollegeController homePageCollegeController = Get.find<HomePageCollegeController>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Rx<String> profiePic = ImageConstant.nullProfile.obs;

  Rx<String> gender = "female".obs;

  Rx<DateTime>? selectedDate = Rx(DateTime(DateTime.now().year - 13, DateTime.now().month, DateTime.now().day));

  List<String> genderList = ["male", "female", "other"];
  List<String>? list;

  // checkbox update profile
  Rx<bool> african_american = false.obs;
  Rx<bool> american_indian = false.obs;
  Rx<bool> asian_or_pacific = false.obs;
  Rx<bool> hispanic_latino = false.obs;
  Rx<bool> white = false.obs;
  Rx<bool> other = false.obs;

  Rx<String> date = Rx("00/00/0000");

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  HomePageCollegeController controller =Get.put(HomePageCollegeController());

  @override
  void onClose() {
    super.onClose();
  }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.getProfile();
    print("dispose == > TellUsAboutYourselfController");
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
        String? ethnicity =
            ViewProfileModel.fromJson(response.data).data![0].ethnicity ?? null;
        if (ethnicity != null) {
          list = jsonDecode(ethnicity).cast<String>();
        }
        african_american.value = list?.contains("african_american") ?? false;
        american_indian.value = list?.contains("american_indian") ?? false;
        asian_or_pacific.value = list?.contains("asian_or_pacific") ?? false;
        hispanic_latino.value = list?.contains("hispanic_latino") ?? false;
        white.value = list?.contains("white") ?? false;
        other.value = list?.contains("other") ?? false;
        firstNameController.text = ViewProfileModel.fromJson(response.data).data![0].name ?? "";
        lastNameController.text = ViewProfileModel.fromJson(response.data).data![0].lname ?? "";
        emailController.text = ViewProfileModel.fromJson(response.data).data![0].email ?? "";
        date.value = ViewProfileModel.fromJson(response.data).data![0].dob ?? "";
        profiePic.value = ViewProfileModel.fromJson(response.data).data![0].profileImage ?? ImageConstant.nullProfile;
        gender.value = ViewProfileModel.fromJson(response.data).data![0].gender ?? "male";

        isLoading(false);
      } else {
        isLoading.value = false;
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e, line) {
      // isLoading.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      print("catch(e)==>${line}");
    }
  }

  RxBool isLoadingUpdateProfile = false.obs;
  Future<void> updateProfile() async {
    isLoadingUpdateProfile(true);
    List<String> ethnicity = [];
    if (african_american.value) {
      ethnicity.add('"african_american"');
    }
    if (american_indian.value) {
      ethnicity.add('"american_indian"');
    }
    if (asian_or_pacific.value) {
      ethnicity.add('"asian_or_pacific"');
    }
    if (hispanic_latino.value) {
      ethnicity.add('"hispanic_latino"');
    }
    if (white.value) {
      ethnicity.add('"white"');
    }
    if (other.value) {
      ethnicity.add('"other"');
    }

    var data = {
      'name': firstNameController.text,
      'lname': lastNameController.text,
      'gender': '${gender.value}',
      'dob': '${date.value}',
      'ethnicity': '$ethnicity',
    };
    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.updateProfile, body: data);
      isLoadingUpdateProfile(false);

      if (response.statusCode == 200) {
        isLoadingUpdateProfile(false);
        Get.toNamed(
          AppRoutes.tellUsAboutYourSchoolScreen,
        );
        AppDialogUtils.showToast(message: '${response.data["message"]}');
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  Future<void> updateProfileImage(CroppedFile file) async {
    print("updateProfileImageeeeee");

    var token = await  FirebaseAuth.instance.currentUser?.getIdToken();
    print("otherer${file.path}");
    var dio = Dio();
    try {
      var headers = {'Authorization': 'Bearer $token'};

      var formData = FormData.fromMap({
        'profile': [
          await MultipartFile.fromFile(
            file.path,
          ),
        ],
      });
      var response = await dio.post(
        AppUrls.updateProfileImage,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        print("dsfdsffds");
        print(json.encode(response.data));
        getProfile();
        homePageCollegeController.getProfile();
      } else {
        isLoading.value = false;

        print("response==statusCode>${response.statusCode}");
      }
      Fluttertoast.showToast(msg: "${response.data["message"]}");
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

// Future<void> updateProfileImage(CroppedFile file) async {
//   var dio = Dio();
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var token = prefs.get('token');
//   try {
//     var headers = {
//       'Authorization':
//       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoyMH0sImlhdCI6MTcwODU4NzQ1NH0.4tcSvW7vZR76ImTNR_hKdOvmCo6d6cHoUVL_GfCyUdU'
//     };
//
//     var formData = FormData.fromMap({
//       'file': [
//         await MultipartFile.fromFile(file.path, ),
//       ],
//     });
//
//     var response = await dio.post(
//       'https://forreal.net:4000/users/editProfile',
//       options: Options(
//         method: 'POST',
//         headers: headers,
//       ),
//       data: formData,
//     );
//
//     if (response.statusCode == 200) {
//       print("dsfdsffds");
//       print(json.encode(response.data));
//     } else {
//       print(response.statusMessage);
//     }
//
//     print('Request Headers: ${response.requestOptions.headers}');
//     print('Response Data: ${response.data}');
//     Fluttertoast.showToast(msg: "${response.data["message"]}");
//   } catch (e) {
//     print("Error uploading image: $e");
//   }
// }
}
