import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/progress_dialog_utils.dart';
import '../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../data/data_sources/remote/api_client.dart';
import '../../presentation/login_screen/login_screen.dart';
import '../custom_icon_button.dart';
import 'appbar_title.dart';

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Account'),
        content: Text(
            'Are you sure you want to delete your account? This action cannot be undone and you will lose all your data.'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Proceed to Delete Account'),
            onPressed: () {
              deleteAccount();
              Navigator.of(context).pop();
             // _showPasswordConfirmationDialog(context);
            },
          ),
        ],
      );
    },
  );
}


PreferredSizeWidget appbarHomepage(BuildContext context001, [bool? isHomePage]) {
  HomePageCollegeController homePageCollegeController = Get.find<HomePageCollegeController>();


  return PreferredSize(
      preferredSize: Size.fromHeight(70.v), // preferred height for the app bar
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.v,),
            Container(
              height: 64.v,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle593,
                        height: 49.v,
                        width: 46.h),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_college".tr,
                          style:
                              CustomTextStyles.titleMediumBlack90001.copyWith(
                            color: appTheme.black90001,
                          ),
                        ),
                        Text(
                          "lbl_thriver".tr,
                          style:
                              CustomTextStyles.titleMediumBlack90001.copyWith(
                            color: appTheme.black90001,
                          ),
                        ),
                      ],
                    ),
                    CustomImageView(
                      onTap: () {
                        if(isHomePage==true){

                        }else{
                          Get.offAllNamed(AppRoutes.homeScreen);
                        }

                      },
                      imagePath: ImageConstant.imgRoadmap21,
                      height: 46.v,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.topStudentsOneScreen);
                      },
                      child: Container(
                        height: 48.v,
                        width: 48.v,
                        decoration: BoxDecoration(
                            color: Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                          child: CustomImageView(
                            imagePath: ImageConstant.imgSearch,
                            height: 30.v,
                            width: 30.v,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.tellUsAboutYourselfScreen,
                        )?.then((value) => {
                          homePageCollegeController.getProfile()

                        });
                      },
                      child: Obx(
                        () => CustomImageView(
                            radius: BorderRadius.circular(50.adaptSize),
                            fit: BoxFit.fill,
                            imagePath:
                                homePageCollegeController.profiePic.value,
                            height: 50.adaptSize,
                            width: 50.adaptSize),
                      ),
                    ),
                    CustomImageView(
                      onTap: () {
                        showModalBottomSheet(
                          context: context001,
                          builder: (BuildContext context) {
                            return _bottomsheetWidget(context001);
                          },
                        );
                      },
                      imagePath: ImageConstant.imgMegaphone,
                      color: theme.colorScheme.primary,
                      height: 30.v,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}

AppBar myAppbar({required String title, String? imgUrl}) {
  return AppBar(surfaceTintColor: Colors.white,
    leadingWidth: 32.h,
    backgroundColor: Colors.white,
    elevation: .5,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (imgUrl != null)
          Container(
            width: 43.h,
            height: 43.h,
            child: CustomImageView(
              radius: BorderRadius.circular(100),
              fit: BoxFit.cover,
              imagePath: imgUrl,
            ),
          ),
        AppbarTitle(text: title, margin: EdgeInsets.only(left: 10.h)),
      ],
    ),
  );
}

_bottomsheetWidget(BuildContext context001) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
                Get.offAllNamed(AppRoutes.homeScreen);
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,


                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child:
                        CustomImageView(imagePath: ImageConstant.imgEdit38x38)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 10.h, top: 10.v, bottom: 7.v),
                    child: Text("lbl_your_roadmap".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),
          SizedBox(height: 22.v),

          // College Matches

          GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.recommendedCollegeScreen);
                // onTapFrame2();
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(11.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: CustomImageView(
                        color: Colors.black, imagePath: ImageConstant.imgUser)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 9.v, bottom: 8.v),
                    child: Text("College Matches".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),
          SizedBox(height: 22.v),

          //Favorites
          GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.favoritesCollegeScreen);
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(11.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: CustomImageView(
                        color: Colors.black, imagePath: ImageConstant.imgUser)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 9.v, bottom: 8.v),
                    child: Text("College Favorites".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),
          SizedBox(height: 22.v),

          GestureDetector(
              onTap: () {
                Get.back();

                onTaptellUsAboutYourSchoolScreen();
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(10.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: CustomImageView(
                        color: Colors.black, imagePath: ImageConstant.imgEdit)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 9.v, bottom: 8.v),
                    child: Text("lbl_edit_account".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),
          SizedBox(height: 22.v),
          GestureDetector(
              onTap: () {
                Get.back();

                onTapFrame2();
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(11.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: CustomImageView(
                        color: Colors.black, imagePath: ImageConstant.imgUser)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 9.v, bottom: 8.v),
                    child: Text("lbl_edit_photo".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),
          SizedBox(height: 22.v),
          GestureDetector(
              onTap: () {
                onTapFrame3();
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(10.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: CustomImageView(
                        color: Colors.black,
                        imagePath: ImageConstant.imgSettings)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 10.h, top: 10.v, bottom: 7.v),
                    child: Text("lbl_logout".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ])),

          SizedBox(height: 22.v),
          GestureDetector(
              onTap: () {
                Get.back();
                _showDeleteConfirmationDialog(context001);
              //   deleteAccount();
              },
              child: Row(children: [
                CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(10.h),
                    decoration: IconButtonStyleHelper.fillGrayTL19,
                    child: Icon(Icons.delete_outline,size: 26,)
                ),
                Padding(
                    padding:
                    EdgeInsets.only(left: 10.h, top: 10.v, bottom: 7.v),
                    child: Text("Delete Account".tr,
                        style: CustomTextStyles.bodyLargeInterBlack90001_1))
              ]))
        ]),
  );
}

/// Navigates to the tellUsAboutYourSchoolScreen when the action is triggered.
onTaptellUsAboutYourSchoolScreen() {
  Get.toNamed(
    AppRoutes.tellUsAboutYourSchoolScreen,
  );
}

/// Navigates to the tellUsAboutYourselfScreen when the action is triggered.
onTapFrame2() {
  Get.toNamed(
    AppRoutes.tellUsAboutYourselfScreen,
  );
}

/// Navigates to the loginScreen when the action is triggered.
onTapFrame3() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', false);
  Get.offAllNamed(
    AppRoutes.loginScreen,
  );
}

Future<void> deleteAccount() async {

  try {
    var response = await ApiClient().postRequest(endPoint: AppUrls.deletAccount, body: {});
    if (response.statusCode == 200) {
      AppDialogUtils.showToast(message: "${response.data["message"]}");
      Get.offAllNamed(AppRoutes.loginScreen);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
    } else {
      AppDialogUtils.showToast(message: "${response.data["message"]}");
    }
  } catch (e, log) {
    print("object${e.toString()}");
    print("object${log}");
  }
}
