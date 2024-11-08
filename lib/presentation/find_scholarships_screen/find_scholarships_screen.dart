import 'package:colleage_thriver/presentation/notes/you_awesome_screen.dart';

import '../../core/utils/progress_dialog_utils.dart';
import '../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../data/data_sources/remote/api_client.dart';
import '../../widgets/app_bar/appbar_home_page.dart';
import '../../widgets/custom_outlined_button.dart';
import '../forgot_password_screen/get_your_college_matches_screen/models/get_your_college_matches_model.dart';
import 'controller/find_scholarships_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
class FindScholarshipsScreen extends StatefulWidget {
   FindScholarshipsScreen({Key? key}) : super(key: key);

  @override
  State<FindScholarshipsScreen> createState() => _FindScholarshipsScreenState();

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
}

class _FindScholarshipsScreenState extends State<FindScholarshipsScreen> {
 FindScholarshipsController controller = Get.put(FindScholarshipsController());

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
            ()=>isLoadingCollegeGetMatchOne.value ? Center(child: CircularProgressIndicator(),) :  Padding(
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
                    "${FindScholarshipsScreen.title[index]}",
                    style: CustomTextStyles.titleMediumWhiteA700_1,
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "${FindScholarshipsScreen.subtitle[index]}",
                    style: CustomTextStyles.titleSmallRobotoMedium,
                  ),
                  SizedBox(height: 13.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(index==0)getYourCollegeMatchesModel?.allPoints?[0].activity31 == null ? Expanded(
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
                      if(index==1)getYourCollegeMatchesModel?.allPoints?[0].activity32 == null ? Expanded(
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
                      if(index==2)getYourCollegeMatchesModel?.allPoints?[0].activity33 == null ? Expanded(
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
                      if(index==3)getYourCollegeMatchesModel?.allPoints?[0].activity34 == null ? Expanded(
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
                      if(index==4)getYourCollegeMatchesModel?.allPoints?[0].activity35 == null ? Expanded(
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

                      //
                      // Expanded(
                      //   child: CustomOutlinedButton(
                      //     onPressed: (){
                      //       Get.to(()=>TodoList());
                      //     },
                      //     text: "lbl_todo".tr,
                      //     margin: EdgeInsets.only(right: 4.h),
                      //     buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                      //   ),
                      // ),
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
