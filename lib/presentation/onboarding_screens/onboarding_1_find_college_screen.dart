import 'package:colleage_thriver/presentation/onboarding_screens/widgets/onboard_first.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/app_bar/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/onboard_second.dart';
import 'widgets/onboard_third.dart';

   class Onboarding1FindCollegeScreen extends StatefulWidget {
     Onboarding1FindCollegeScreen({Key? key}) : super(key: key);

  @override
  State<Onboarding1FindCollegeScreen> createState() => _Onboarding1FindCollegeScreenState();
}

class _Onboarding1FindCollegeScreenState extends State<Onboarding1FindCollegeScreen> {
  final PageController _pageController =PageController();

   int _currentPageIndex = 0;

   @override
   void dispose() {
     _pageController.dispose();
     super.dispose();
   }

  void _changeToNextPage() {

     if(_currentPageIndex < 2){

       _pageController.nextPage(
         duration: Duration(milliseconds: 300),
         curve: Curves.easeInOut,
       );
       setState(() {
       });
     }else{

       onTapSkip();
     }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppBar(),
       body : SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 63.v,),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        _currentPageIndex =value;
                        print("object$value");
                      },
                      children: const [
                        OnBoardFirst(),
                        OnBoardSecond(),
                        OnBoardThird(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 61),
                  SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 3,
                    effect:  WormEffect(
                      activeDotColor: theme.colorScheme.primary,
                      dotHeight: 12.0,
                      dotWidth: 12.0,
                    ), // your preferred effect
                    onDotClicked: (index) {},
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                      alignment: Alignment.center,
                      width: 202.h,
                      text: "lbl_next".tr,
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle:
                      CustomTextStyles.titleLargeRobotoWhiteA700,
                      onPressed: () async{

                        _changeToNextPage();
                      }),
                   SizedBox(height: 40.v),

                ],
              ),
            ),
          ),
        )
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(height: 56.v, actions: [
        InkWell(
            onTap: () {
              onTapSkip();
            },
            child: Container(height: 60,width: 100,
              child: Center(
                child: Text("lbl_skip".tr,
                    style: CustomTextStyles.titleMediumGray800.copyWith(
                 color: appTheme.gray800,
                )),
              ),
            ))
      // AppbarSubtitleOne(
      //     text: "lbl_skip".tr,
      //     margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 16.v),
      //     onTap: () {
      //       onTapSkip();
      //     })
    ]);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapSkip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarding', true);
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }


}
