import 'package:fluttertoast/fluttertoast.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:colleage_thriver/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/api_client.dart';

class MapController extends GetxController {

  TextEditingController emailValueController = TextEditingController();
  TextEditingController sVGController = TextEditingController();
  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailValueController.dispose();
    sVGController.dispose();
  }


  Future<void> onTapLogin() async{
     // bool okk =await  ApiClient().checkInternetConnection();
     print("checkInternetConnection==}");

    isLoading.value = true;
    var data = {'email': '${emailValueController.text}', 'password': '${sVGController.text}'};
       try {
         var response = await ApiClient().postRequest(endPoint: AppUrls.login, body: data);
         isLoading.value = false;
         print(response.toString());
         if (response.statusCode == 200) {
           SharedPreferences prefs = await SharedPreferences.getInstance();
           print("dfsfdfksfsdfsdf");
           await prefs.setBool('isLoggedIn', true);
           await prefs.setString('token', "${response.data["token"]}");
           Get.offAllNamed(AppRoutes.homeScreen);
           AppDialogUtils.showToast(message: "${response.data["message"]}");
         }else{
           AppDialogUtils.showToast(message: "${response.data["message"]}",toastLength: Toast.LENGTH_LONG);
         }
       } catch (e,stackTrace) {
         isLoading.value = false;
         AppDialogUtils.showToast(message: '${e.toString()}');
         print("catch(e)==>${e.toString()}");
         // ignore: unnecessary_brace_in_string_interps
         print("stackTrace:${stackTrace}");
       }
  }
}
