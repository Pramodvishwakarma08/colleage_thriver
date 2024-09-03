import 'package:flutter/cupertino.dart';
import 'package:colleage_thriver/core/app_export.dart';

class OnBoardThird extends StatelessWidget {
  const OnBoardThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 166.v,
            width: 231.h,
            margin: EdgeInsets.only(left: 34.h),
            padding: EdgeInsets.symmetric(horizontal: 58.h, vertical: 28.v),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgGroup218),
                    fit: BoxFit.cover)),
            child: CustomImageView(
                imagePath: ImageConstant.imgRectangle593,
                height: 85.v,
                width: 82.h,
                alignment: Alignment.topRight)),
        Spacer(flex: 39),
        Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Text("msg_find_best_scholarships".tr,
                style: theme.textTheme.headlineLarge)),
        SizedBox(height: 19.v),
        Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 218.h,
                child: Text("msg_kickstart_your_college".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeBlack90001
                        .copyWith(height: 1.11)))),
        SizedBox(height: 47.v),
      ],
    );
  }
}
