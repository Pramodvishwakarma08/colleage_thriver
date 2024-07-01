import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:colleage_thriver/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/api_client.dart';

class LoginController extends GetxController {

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
         print("line_36");
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
           print("objectsdf");
           AppDialogUtils.showToast(message: "${response.data["message"]}",toastLength: Toast.LENGTH_LONG);
         }
       } catch (e,stackTrace) {
         isLoading.value = false;
         AppDialogUtils.showToast(message: '${e.toString()}');
         print("catch(e)==>${e.toString()}");
         print("stackTrace:${stackTrace}");
       }
  }


  //google login





  Future<void> loginWithGoogleWithBackend({required String email , required String token,required String name,required String lastname,}) async{
    print("loginWithGoogleWithBackend==}");
    var data = {'email': email, 'token': token,"name" : name ,"lname" : lastname};
    try {
      var response = await ApiClient().postRequest(endPoint: AppUrls.loginWithGoogle, body: data);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', "${response.data["token"]}");
        Get.offAllNamed(AppRoutes.homeScreen);
        AppDialogUtils.showToast(message: "${response.data["message"]}");
      }else{
        AppDialogUtils.showToast(message: "${response.data["message"]}",toastLength: Toast.LENGTH_LONG);
      }
    } catch (e,stackTrace) {
      AppDialogUtils.showToast(message: '${e.toString()}');
    }
  }
   List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  ],);
  Future<void> signInWithGoogle() async {
    _googleSignIn.signOut();
    try {
      final GoogleSignInAccount? reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        print('user null');
        return  ;
      }else{
        final userData = await reslut.authentication;
        final credential = GoogleAuthProvider.credential(accessToken: userData.accessToken, idToken: userData.idToken);
        var finalResult = await  FirebaseAuth.instance.signInWithCredential(credential);
        var fullname = await  FirebaseAuth.instance.currentUser?.displayName;
        var email = await  FirebaseAuth.instance.currentUser!.email!;
        var token = await  FirebaseAuth.instance.currentUser!.uid;
        print("fullname==>${fullname}");
        List<String> nameParts = fullname!.split(' ');
        String firstName = nameParts[0];
        String lastName = nameParts[1];
        print("First Name: $firstName");
        print("Last Name: $lastName");

        print("email==>${email}");
        print("token==>${token}");
        print("finalResult==>${finalResult}");
        loginWithGoogleWithBackend(email: email, token: token,lastname: lastName,name: firstName);
      }

    } catch (error) {
      print('=====Google Sign-In Error: $error');
    }
  }






}
