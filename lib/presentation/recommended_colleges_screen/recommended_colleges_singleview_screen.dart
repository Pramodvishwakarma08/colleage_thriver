// ignore_for_file: must_be_immutable

import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/data/data_sources/remote/api_client.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_outlined_button.dart';
import '../favorites_college_screen/controller/favorites_college_screen_controller.dart';
import '../search/models/CollegeDetailListModel.dart';
import '../search_compare_with/compare_with_search_screen.dart';

class RecommendedCollegesSingleViewScreen extends StatefulWidget {
  RecommendedCollegesSingleViewScreen({Key? key, required this.seletedClg})
      : super(key: key);
  final Message seletedClg;

  @override
  _RecommendedCollegesSingleViewScreenState createState() =>
      _RecommendedCollegesSingleViewScreenState();
}

class _RecommendedCollegesSingleViewScreenState
    extends State<RecommendedCollegesSingleViewScreen> {
  FavoritesCollegeController controller = Get.put(FavoritesCollegeController());

  Future<void> favrate(bool isfav, String colleageId) async {
    var data = {'favourite': isfav ? "1" : "0", 'college_id': colleageId};

    var response = await ApiClient()
        .postRequest(endPoint: "favourite-college", body: data);
    print("response = ${response.data}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.getCollegeDetailList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "msg_recommended_colleges".tr),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 10.v),
        child: ListView(
          children: [
            CustomImageView(
              border: Border.all(color: Colors.grey),
              imagePath: widget.seletedClg.photo,
              height: 203.v,
              width: 340.h,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(25.h),
              margin: EdgeInsets.only(left: 6.h),
            ),
            SizedBox(height: 18.v),
            Row(
              children: [
                Container(
                  width: 200.h,
                  margin: EdgeInsets.only(left: 6.h, right: 83.h),
                  child: Text(
                    widget.seletedClg.instnm!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleLarge22.copyWith(height: 1.09),
                  ),
                ),
                widget.seletedClg.fav
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.seletedClg.fav = false;
                            favrate(false, "${widget.seletedClg.id}");
                          });
                        },
                        child: Container(
                            width: 261.h - 200.h,
                            child: Icon(Icons.favorite,
                                size: 35, color: Colors.red)),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.seletedClg.fav = true;
                            favrate(true, "${widget.seletedClg.id}");
                          });
                        },
                        child: Container(
                            width: 261.h - 200.h,
                            child: Icon(Icons.favorite_border,
                                color: Colors.grey, size: 35)),
                      ),
              ],
            ),
            SizedBox(height: 10.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text("${widget.seletedClg.city.toString()}",
                      style: CustomTextStyles.bodyLargeInterGray600),
                ),
                _compareWithButton(),
              ],
            ),
            SizedBox(height: 23.v),
            _gridView4Cards(),
            SizedBox(height: 21.v),
            _financialsSection(),
            SizedBox(height: 20.v),
            Text("lbl_financials".tr,
                style: CustomTextStyles.titleLargeRobotoBold),
            SizedBox(height: 3.v),
            InkWell(
              onTap: () async {
                try {
                  await launchUrl(Uri.parse(buildTrim()));
                } catch (e, s) {
                  Logger().e(e, stackTrace: s);
                }
              },
              child: Text("${widget.seletedClg.insturl}",
                  style:
                      CustomTextStyles.titleMediumBlack90001Medium16linkcolor),
            ),
            SizedBox(height: 20.v),
            CustomElevatedButton(
              text: "APPLY NOW".tr,
              onPressed: ()async {
                  try {
                    await launchUrl(Uri.parse(buildTrim()));
                  } catch (e, s) {
                    Logger().e(e, stackTrace: s);
                  }

                // print("${widget.seletedClg.insturl}");
                // _launchURL(url: widget.seletedClg.insturl ?? "");
              },
              margin: EdgeInsets.only(left: 28.h, right: 28.h, bottom: 37.v),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String buildTrim() {
    if (!widget.seletedClg.insturl!
        .trim()
        .toString()
        .trim()
        .startsWith("https")) {
      return "https://" + widget.seletedClg.insturl!.trim().toString().trim();
    }
    return widget.seletedClg.insturl!.trim().toString().trim();
  }

  /// Section Widget
  Widget _gridView4Cards() {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 43.v,
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        children: [
          cardDatials(
              imagePath: ImageConstant.imgImage1624,
              name: 'Acceptance -',
              value: '${"${widget.seletedClg.admRate}"}%'),
          cardDatials(
              imagePath: ImageConstant.imgThumbsUp,
              name: 'Average GPA -',
              value: '${"${widget.seletedClg.gpa}"}'),
          cardDatials(
              imagePath: ImageConstant.imgThumbsUpWhiteA700,
              name: 'Average SAT -',
              value: '${"${widget.seletedClg.satAvg}"}'),
          cardDatials(
              imagePath: ImageConstant.imgThumbsUp,
              name: 'Average ACT -',
              value: '${"${widget.seletedClg.actcmmid}"}'),
        ],
      ),
    );
  }

  Widget cardDatials({
    required String imagePath,
    required String name,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 18.v,
            width: 19.h,
            color: Colors.white70,
          ),
          Opacity(
            opacity: 0.7,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                top: 2.v,
              ),
              child: Text(
                name,
                style: CustomTextStyles.labelLargeRobotoWhiteA700,
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                value,
                style: CustomTextStyles.titleSmallRobotoWhiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _compareWithButton() {
    return CustomOutlinedButton(
      onPressed: () {
        Get.to(() => CompareWithSearchScreen(selectedClg: widget.seletedClg));
      },
      height: 36.v,
      width: 150.h,
      text: "Compare with".tr,
      rightIcon: Container(
        margin: EdgeInsets.only(left: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowright,
          color: theme.colorScheme.primary,
          height: 14.v,
          width: 17.h,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineYellow,
      buttonTextStyle: CustomTextStyles.titleMediumBlack90001Medium16,
    );
  }

  Widget _financialsSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.h, right: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.v, bottom: 6.v),
                child: Text("lbl_financials".tr,
                    style: CustomTextStyles.titleLargeRobotoBold),
              ),
              Container(
                height: 36.v,
                width: 153.h,
              ),
            ],
          ),
        ),
        SizedBox(height: 14.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("msg_in_state_tuition".tr,
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
            Text("${widget.seletedClg.tuitionfeeIn}",
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
          ],
        ),
        SizedBox(height: 10.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("msg_out_of_state_tuition".tr,
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
            Text("${widget.seletedClg.tuitionfeeOut}",
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
          ],
        ),
        SizedBox(height: 10.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("msg_average_total_cost".tr,
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
            Text("${widget.seletedClg.costt4A}",
                style: CustomTextStyles.titleMediumBlack90001Medium16
                    .copyWith(color: appTheme.black90001)),
          ],
        ),
        SizedBox(height: 10.v),
      ],
    );
  }
}
