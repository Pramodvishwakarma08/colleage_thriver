import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/apI_endpoint_urls.dart';
import 'package:colleage_thriver/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../../sockettt/sockettt.dart';

class LoginController extends GetxController {

  TextEditingController emailValueController = TextEditingController();
  TextEditingController sVGController = TextEditingController();
  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;


  @override
  void onClose() {
    super.onClose();

  }

  Future<void> loginWithGoogleWithBackend({
    required String email,
    required String token,
    required String name,
    required String lastname,
  }) async {
    isLoading.value = true;
    var data = {
      'user_id': email,
      'token': token,
      "name": name,
      "lname": lastname
    };
    try {
      var response = await ApiClient().postRequest(
          endPoint: AppUrls.loginWithGoogle, body: data);
      if (response.statusCode == 200) {
        isLoadingGooglelogin.value = false;
        isLoadingApplelogin.value = false;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        try {
          socketDisConnect();
          socketConnect();
        } catch (e) {
          print("Error socket.connect() ${e.toString()}");
        }
        Get.offAllNamed(AppRoutes.homeScreen);
        AppDialogUtils.showToast(message: "${response.data["message"]}");
      } else {
        isLoading.value = false;
        AppDialogUtils.showToast(message: "${response.data["message"]}", toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      isLoadingGooglelogin.value = false;
      isLoadingApplelogin.value = false;
      isLoading.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
    }
  }


  final _auth = FirebaseAuth.instance;


  Future<void> googleLogin(User ? user) async {
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
      getIdToken(_auth.currentUser,"signInWithEmailAndPassword");
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'network-request-failed') {
        log('No Internet Connection');
      } else if (e.code == "invalid-credential") {
        AppDialogUtils.showToast(
            message: "Please Enter correct Email or Password",
            toastLength: Toast.LENGTH_LONG);
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


  Future<void> getIdToken(User ? user, String email_password) async {
    if (user != null) {
      try {
        var name = splitName(user.displayName ?? "*** *****");
        String ? idToken = await user.getIdToken();
        if("signInWithEmailAndPassword" == email_password){
          if (user.emailVerified) {
            loginWithGoogleWithBackend(email: user.uid,
                token: idToken!,
                name: '${name["firstName"]}',
                lastname: '${name["lastName"]}');
          } else {
            // isLoadingGooglelogin.value = false;
            isLoading.value = false;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            AppDialogUtils.showToast(message: "Please check your email to confirm your account", toastLength: Toast.LENGTH_LONG);
          }

        }else{
          loginWithGoogleWithBackend(email: user.uid,
              token: idToken!,
              name: '${name["firstName"]}',
              lastname: '${name["lastName"]}');
        }


      } catch (e, line) {
        isLoading.value = false;
        print('Error getting ID token: $e');
        print('line$line');
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
  Rx<bool> isLoadingGooglelogin = false.obs;
  Rx<bool> isLoadingApplelogin = false.obs;

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
    await googleSignIn.signOut();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount == null) {
        throw Exception('User canceled sign-in');
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,);
      final UserCredential userCredential = await firebaseAuth
          .signInWithCredential(credential);
      final User? user = await userCredential.user;
      if (user == null) {
        AppDialogUtils.showToast(message: "User not found");
        isLoadingGooglelogin.value = false;
      } else {
        await getIdToken(user,"signInWithGoogle");
      }
    } catch (error) {
      AppDialogUtils.showToast(message: "signInWithGoogle failed: ${error}");
      isLoadingGooglelogin.value = false;
    } finally {
      isLoadingGooglelogin.value = false;
    }
  }

  Future<void> signInWithApple() async {
    isLoadingApplelogin.value = true;
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential = result.credential!;
        final oAuthCredential = OAuthProvider('apple.com');
        final credential = oAuthCredential.credential(
            idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
        final UserCredential userCredential = await firebaseAuth
            .signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        await getIdToken(firebaseUser,"signInWithApple");
        break;
      case AuthorizationStatus.error:
        isLoadingApplelogin.value = false;
        AppDialogUtils.showToast(message: "${result.error.toString()}");
        break;

      case AuthorizationStatus.cancelled:
        isLoadingApplelogin.value = false;
        AppDialogUtils.showToast(message: "Sign in aborted by user");
        break;

      default:
        isLoadingApplelogin.value = false;
        throw UnimplementedError();
    }
  }


}