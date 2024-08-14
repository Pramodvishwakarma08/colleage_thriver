import 'dart:developer';
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
  Rx<bool> isLoadingGooglelogin = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailValueController.dispose();
    sVGController.dispose();
  }

  // Future<void> onTapLogin() async {
  //   // bool okk =await  ApiClient().checkInternetConnection();
  //   print("checkInternetConnection==}");
  //
  //   isLoading.value = true;
  //   var data = {
  //     'email': '${emailValueController.text}',
  //     'password': '${sVGController.text}'
  //   };
  //   try {
  //     var response =
  //         await ApiClient().postRequest(endPoint: AppUrls.login, body: data);
  //     print("line_36");
  //     isLoading.value = false;
  //     print(response.toString());
  //     if (response.statusCode == 200) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       print("dfsfdfksfsdfsdf");
  //       await prefs.setBool('isLoggedIn', true);
  //       await prefs.setString('token', "${response.data["token"]}");
  //       Get.offAllNamed(AppRoutes.homeScreen);
  //       AppDialogUtils.showToast(message: "${response.data["message"]}");
  //     } else {
  //       print("objectsdf");
  //       AppDialogUtils.showToast(
  //           message: "${response.data["message"]}",
  //           toastLength: Toast.LENGTH_LONG);
  //     }
  //   } catch (e, stackTrace) {
  //     isLoading.value = false;
  //     AppDialogUtils.showToast(message: '${e.toString()}');
  //     print("catch(e)==>${e.toString()}");
  //     print("stackTrace:${stackTrace}");
  //   }
  // }

  //google login
  //
  Future<void> loginWithGoogleWithBackend({
    required String email,
    required String token,
    required String name,
    required String lastname,
  }) async {
    isLoading.value = true;
    var data = {
      'email': email,
      'token': token,
      "name": name,
      "lname": lastname
    };
    try {
      var response = await ApiClient().postRequest(endPoint: AppUrls.loginWithGoogle, body: data);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        // await prefs.setString('token', "${response.data["token"]}");
        Get.offAllNamed(AppRoutes.homeScreen);
        isLoading.value = false;
        AppDialogUtils.showToast(message: "${response.data["message"]}");
      } else {
        isLoading.value = false;
        AppDialogUtils.showToast(
            message: "${response.data["message"]}",
            toastLength: Toast.LENGTH_LONG);
      }
    } catch (e, stackTrace) {
      isLoading.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
    }
  }

  // List<String> scopes = <String>[
  //   'email',
  //   'https://www.googleapis.com/auth/contacts.readonly',
  // ];
  //
  // GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [],
  // );
  //
  //
  // Future<void> signInWithGoogle() async {
  //   _googleSignIn.signOut();
  //   try {
  //     final GoogleSignInAccount? reslut = await _googleSignIn.signIn();
  //     if (reslut == null) {
  //       print('user null');
  //       return;
  //     } else {
  //       final userData = await reslut.authentication;
  //       final credential = GoogleAuthProvider.credential(
  //           accessToken: userData.accessToken, idToken: userData.idToken);
  //       var finalResult =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //       var fullname = await FirebaseAuth.instance.currentUser?.displayName;
  //       var email = await FirebaseAuth.instance.currentUser!.email!;
  //       var token = await FirebaseAuth.instance.currentUser!.uid;
  //       print("fullname==>${fullname}");
  //       List<String> nameParts = fullname!.split(' ');
  //       String firstName = nameParts[0];
  //       String lastName = nameParts[1];
  //       print("First Name: $firstName");
  //       print("Last Name: $lastName");
  //
  //       print("email==>${email}");
  //       print("token==>${token}");
  //       print("finalResult==>${finalResult}");
  //       loginWithGoogleWithBackend(
  //           email: email, token: token, lastname: lastName, name: firstName);
  //     }
  //   } catch (error) {
  //     print('=====Google Sign-In Error: $error');
  //   }
  // }

  final _auth = FirebaseAuth.instance;


  Future<void> googleLogin( User ? user ) async {
    await user?.getIdToken();
  }

  Future<void> signInWithEmailAndPassword() async {
    isLoading.value = true;

    try {
       await _auth.signInWithEmailAndPassword(
        email: emailValueController.text,
        password: sVGController.text,
      );
       print("${_auth.currentUser?.refreshToken}");
       getIdToken(_auth.currentUser);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'network-request-failed') {
        log('No Internet Connection');
      } else if (e.code == "invalid-credential") {
        AppDialogUtils.showToast(message: "Please Enter correct Email or Password",toastLength: Toast.LENGTH_LONG);
      } else if (e.code == 'user-not-found') {
        AppDialogUtils.showToast(message: "User not found");
      } else if (e.code == 'too-many-requests') {
        AppDialogUtils.showToast(message: "Too many requests");
      } else if (e.code == 'unknwon') {
        AppDialogUtils.showToast(message: "Unknown error${e.message}");
      } else {
        AppDialogUtils.showToast(message: "${e.message}");
        isLoading.value = false;
      }
    }
  }


  Future<void> getIdToken( User ? user ) async {
    if (user != null) {
      try {
        var name = splitName(user.displayName!);
        String ?  idToken = await user.getIdToken();
        print('ID Token: $idToken');
       if(user.emailVerified){
         isLoadingGooglelogin.value = false;
         isLoading.value = false;
         loginWithGoogleWithBackend(email: user.email!, token: idToken!, name: '${name["firstName"]}', lastname: '${name["lastName"]}');

      //   Get.offAllNamed(AppRoutes.homeScreen);
       }else{
         isLoadingGooglelogin.value = false;
         isLoading.value = false;
         SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setBool('isLoggedIn', true);

         AppDialogUtils.showToast(message: "Please check your email to confirm your account",toastLength: Toast.LENGTH_LONG);
       }
      } catch (e) {
        isLoadingGooglelogin.value = false;
        isLoading.value = false;
        print('Error getting ID token: $e');
      }
    } else {
      print('No user is currently signed in.');
    }
  }

  Map<String, String> splitName(String fullname) {
    List<String> parts = fullname.split(' ');
    String firstName = parts[0];
    String lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }


  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Future<void> signInWithGoogle() async {
  //   isLoadingGooglelogin.value = true;
  //       googleSignIn.signOut();
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //
  //     // Handle potential user cancellation
  //     if (googleSignInAccount == null) {
  //       throw Exception('User canceled sign-in');
  //     }
  //
  //     // Obtain the authentication data
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount.authentication;
  //
  //
  //     // Create a Firebase credential with the obtained data
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //
  //
  //     // Sign in to Firebase with the credential
  //     final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
  //     print("1googleSignInAuthentication=accessToken=>${await googleSignInAuthentication.accessToken}");
  //     print("2googleSignInAuthentication=idToken=>${await googleSignInAuthentication.idToken}");
  //     print("7userCredential=getIdToken=>${await userCredential.user!.getIdToken()}");
  //
  //
  //     // Access the signed-in user
  //     final User? user = userCredential.user;
  //
  //
  //     if (user == null) {
  //       throw Exception('User not found');
  //     }else{
  //      await getIdToken(user);
  //     }
  //     //
  //     // assert(!user.isAnonymous);
  //     // assert(await user.getIdToken() != null);
  //     // final User currentUser = firebaseAuth.currentUser!;
  //     // assert(user.uid == currentUser.uid);
  //     // print('signInWithGoogle succeeded: $user');
  //
  //   } catch (error) {
  //     print('signInWithGoogle failed: $error');
  //     rethrow; // Rethrow the error to handle it at a higher level
  //   }
  // }

  Future<void> signInWithGoogle() async {
    isLoadingGooglelogin.value = true;

    // Optional: Sign out from Google to force the selection of an account each time
    await googleSignIn.signOut();

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        throw Exception('User canceled sign-in');
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken,);

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final User? user = await userCredential.user;

      String ? refreshToken = "${userCredential.credential?.token}";
      print('Refresh Token==>$refreshToken');
      print("refreshToken===>${await userCredential.user?.refreshToken}");
      print("(Get ID Token (Access Token)==>${await user?.getIdToken()}");

      // Access the signed-in user


      // Handle the case where the user is null (shouldn't happen unless there's an error)
      if (user == null) {
        throw Exception('User not found');
      } else {
        // Call the function to handle the user data or token (e.g., send it to your backend)
        await getIdToken(user);
      }
    } catch (error) {
      // Handle and log errors properly
      print('signInWithGoogle failed: $error');
      rethrow; // Rethrow the error to handle it at a higher level if necessary
    } finally {
      // Ensure the loading indicator is stopped, whether the login succeeded or failed
      isLoadingGooglelogin.value = false;
    }
  }


}
