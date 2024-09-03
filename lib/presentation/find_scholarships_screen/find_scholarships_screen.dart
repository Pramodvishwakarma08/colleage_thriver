import 'package:colleage_thriver/presentation/notes/you_awesome_screen.dart';

import '../../widgets/app_bar/appbar_home_page.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/find_scholarships_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
class FindScholarshipsScreen extends GetWidget<FindScholarshipsController> {
 const  FindScholarshipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHomepage(context),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: ListView(
                children: [
                  SizedBox(height: 23.v),
                  Text("msg_find_scholarships".tr,
                      style: CustomTextStyles.titleLargeRoboto),
                  SizedBox(height: 4.v),
                  Text("msg_discover_scholarships".tr,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(height: 1.05)),
                  SizedBox(height: 42.v),
                  _buildCardList()
                ])));
  }


 static const List title =[
    "Search for scholarships",
    "Create a shortlist of scholarships",
    "Apply to scholarships",
    "Apply to college Board Scholarship",
    "File your FAFSA",
  ];
 static const List subtitle =[
    "Learn more about different scholarships",
    "Track scholarships deadlines",
    "Write essays and fill out applications",
    "Send your acceptance to your dream school",
    "Submit your deposit and transcript by the deadline",
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
  activity1() {Get.toNamed(AppRoutes.searchForScholarshipsScreen,);}
  activity2() {Get.toNamed(AppRoutes.createAShortlistScreen,);}
  activity3() {Get.toNamed(AppRoutes.applyToScholarshipsScreen,);}
  activity4() {Get.toNamed(AppRoutes.applyToCollegeBoardPage,);}
  activity5() {Get.toNamed(AppRoutes.fileYourFafsaPage,);}

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
