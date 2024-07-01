import '../../widgets/app_bar/appbar_home_page.dart';
import '../../widgets/custom_outlined_button.dart';
import '../notes/you_awesome_screen.dart';
import 'controller/choose_the_right_college_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

class ChooseTheRightCollegeScreen extends GetWidget<ChooseTheRightCollegeController> {
 const  ChooseTheRightCollegeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHomepage(context),
        body: Padding(
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
                ])));
  }


 static const List title =[
    "View your college matches",
    "Attend college fairs",
    "Visit colleges",
    "Make your college",
    "Send your deposit and transcript",
  ];
 static const List subtitle =[
    "See your top 10 college matches",
    "Learn more about different schools",
    "Visit your top choices before making a decision",
    "Send your acceptance to your dream school",
    "Send your deposit and transcript",
  ];



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
              "${title[index]}",
              style: CustomTextStyles.titleMediumWhiteA700_1,
             ),
             SizedBox(height: 4.v),
             Text(
               "${subtitle[index]}",
              style: CustomTextStyles.titleSmallRobotoMedium,
             ),
             SizedBox(height: 13.v),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Expanded(
                child: CustomOutlinedButton(
                  onPressed: (){
                    Get.to(()=>TodoList());
                  },
                 text: "lbl_todo".tr,
                 margin: EdgeInsets.only(right: 4.h),
                 buttonStyle: CustomButtonStyles.outlineWhiteATL121,
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
