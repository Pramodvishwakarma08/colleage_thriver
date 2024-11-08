import '../../core/utils/progress_dialog_utils.dart';
import '../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../data/data_sources/remote/api_client.dart';
import '../../widgets/app_bar/appbar_home_page.dart';
import '../../widgets/custom_outlined_button.dart';
import '../forgot_password_screen/get_your_college_matches_screen/models/get_your_college_matches_model.dart';
import '../notes/you_awesome_screen.dart';
import '../tell_us_about_yourself_screen/models/view_profile_model.dart';
import 'controller/choose_the_right_college_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

class ChooseTheRightCollegeScreen extends StatefulWidget {
   ChooseTheRightCollegeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTheRightCollegeScreen> createState() => _ChooseTheRightCollegeScreenState();

 static const List title =[
    "View your college matches",
    "Attend college fairs",
    "Visit colleges",
    "Apply to Colleges",
    "Send your deposit and transcript",
  ];
 static const List subtitle =[
    "See your top 10 college matches",
    "Learn more about different schools",
    "Visit your top choices before making a decision",
    "Send your acceptance to your dream school",
    "Send your deposit and transcript",
  ];
}

class _ChooseTheRightCollegeScreenState extends State<ChooseTheRightCollegeScreen> {
 ChooseTheRightCollegeController controller =Get.put(ChooseTheRightCollegeController());

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getYourCollegeMatches();

  }


  RxBool isLoading = false.obs;
  GetyourCollegeMatchesModel? getYourCollegeMatchesModel;
  RxBool isLoadingCollegeGetMatchOne = false.obs;
  Future<void> getYourCollegeMatches() async {
   isLoadingCollegeGetMatchOne(true);
   try {
     var response = await ApiClient().getRequest(
       endPoint: AppUrls.getCollegeMatchAll,
     );
     if (response.statusCode == 200) {
       getYourCollegeMatchesModel = GetyourCollegeMatchesModel.fromJson(response.data);
       isLoadingCollegeGetMatchOne.value = false;

     } else {
       isLoadingCollegeGetMatchOne.value = false;
       AppDialogUtils.showToast(message: '${response.statusCode}');
     }
   } catch (e, line) {
     // isLoadingCollegeGetMatchOne.value = false;
     AppDialogUtils.showToast(message: '${e.toString()}');
     print("catch(e)==>${e.toString()}");
     // ignore: unnecessary_brace_in_string_interps
     print("catch(e)==>${line}");
   }
 }




 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHomepage(context),
        body: Obx(
            ()=>isLoadingCollegeGetMatchOne.value ? Center(child: CircularProgressIndicator(),) : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: ListView(
                  children: [
                    SizedBox(height: 23.v),
                    Text("msg_choose_the_right".tr,
                        style: CustomTextStyles.titleLargeRoboto),
                    SizedBox(height: 4.v),
                    Text("msg_find_the_right_college".tr,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(height: 1.05)),
                    SizedBox(height: 42.v),
                    _buildCardList()
                  ])),
        ));
  }

  Widget _buildCardList() {
   return  ListView.separated(
       physics: NeverScrollableScrollPhysics(),
       shrinkWrap: true,
       separatorBuilder: (context, index) {
        return SizedBox(height: 20.v);
       },
       itemCount: 5,
       itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            switch (index+1) {
              case 1:
                activity1();
                break;
              case 2:
                activity2();
                break;
              case 3:
                activity3();
                break;
              case 4:
                activity4();
                break;
              case 5:
                activity5();
                break;
              default:
                print('Invalid activity index');
            }
          },

          child: Container(
           padding: EdgeInsets.all(10.h),
           decoration: AppDecoration.gradientDeepPurpleFToDeepPurple.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder30,
           ),
           child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomImageView(
              imagePath: ImageConstant.imgFrame427320748141x340,
              height: 141.v,
              width: 340.h,
              radius: BorderRadius.circular(
               25.h,
              ),
             ),

             SizedBox(height: 15.v),
             Text("Activity ${index+1} of 5",
              style: CustomTextStyles.titleMediumYellowA200,
             ),

             SizedBox(height: 4.v),
             Text(
              "${ChooseTheRightCollegeScreen.title[index]}",
              style: CustomTextStyles.titleMediumWhiteA700_1,
             ),
             SizedBox(height: 4.v),
             Text(
               "${ChooseTheRightCollegeScreen.subtitle[index]}",
              style: CustomTextStyles.titleSmallRobotoMedium,
             ),
             SizedBox(height: 13.v),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(index==0)getYourCollegeMatchesModel?.allPoints?[0].householdIncome == null ? Expanded(
                  child: CustomOutlinedButton(
                    onPressed: (){
                      Get.to(()=>TodoList());
                    },
                    text: "lbl_todo".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                  ),
                ) : Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "Done".tr,

                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlinegreenDone,
                ),
               ),
                if(index==1)getYourCollegeMatchesModel?.allPoints?[0].activity21 == null ? Expanded(
                  child: CustomOutlinedButton(
                    onPressed: (){
                      Get.to(()=>TodoList());
                    },
                    text: "lbl_todo".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                  ),
                ) : Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "Done".tr,

                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlinegreenDone,
                ),
               ),
                if(index==2)getYourCollegeMatchesModel?.allPoints?[0].activity22 == null ? Expanded(
                  child: CustomOutlinedButton(
                    onPressed: (){
                      Get.to(()=>TodoList());
                    },
                    text: "lbl_todo".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                  ),
                ) : Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "Done".tr,

                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlinegreenDone,
                ),
               ),
                if(index==3)getYourCollegeMatchesModel?.allPoints?[0].activity23 == null ? Expanded(
                  child: CustomOutlinedButton(
                    onPressed: (){
                      Get.to(()=>TodoList());
                    },
                    text: "lbl_todo".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                  ),
                ) : Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "Done".tr,

                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlinegreenDone,
                ),
               ),
                if(index==4)getYourCollegeMatchesModel?.allPoints?[0].activity24 == null ? Expanded(
                  child: CustomOutlinedButton(
                    onPressed: (){
                      Get.to(()=>TodoList());
                    },
                    text: "lbl_todo".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                  ),
                ) : Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "Done".tr,

                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlinegreenDone,
                ),
               ),


                Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {
                    switch (index+1) {
                      case 1:
                        activity1();
                        break;
                      case 2:
                        activity2();
                        break;
                      case 3:
                        activity3();
                        break;
                      case 4:
                        activity4();
                        break;
                      case 5:
                        activity5();
                        break;
                      default:
                        print('Invalid activity index');
                    }
                  },
                  buttonStyle: CustomButtonStyles.fillYellowTL12,
                 text: "lbl_get_started".tr,
                 margin: EdgeInsets.only(left: 4.h),
                ),
               ),
              ],
             ),
             SizedBox(height: 10.v),
            ],
           ),
          ),
        );
       });
  }

  activity1() {Get.toNamed(AppRoutes.getYourCollegeMatchesScreen,);}

  activity2() {Get.toNamed(AppRoutes.attendCollegeFairsScreen,);}

  activity3() {Get.toNamed(AppRoutes.visitCollegesPage,);}

  activity4() {Get.toNamed(AppRoutes.chooseYourCollegeScreen,);}

  activity5() {Get.toNamed(AppRoutes.sendYourDepositPage,);}

  /// Navigates to the yourRoadmapToCollegeScreen when the action is triggered.
  onTapRoadmapTwentyOne() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the tellUsAboutYourselfScreen when the action is triggered.
  onTapPlay() {
    Get.toNamed(
      AppRoutes.tellUsAboutYourselfScreen,
    );
  }

  /// Navigates to the sliderFromBottomForAlbumScreen when the action is triggered.
  onTapMegaphone() {
    Get.toNamed(
      AppRoutes.sliderFromBottomForAlbumScreen,
    );
  }
}
