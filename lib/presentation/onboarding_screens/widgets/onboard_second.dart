
import 'package:flutter/cupertino.dart';
import 'package:colleage_thriver/core/app_export.dart';

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
            imagePath: ImageConstant.imgGroup29Primary,
            height: 174.v,
            width: 222.h,
            alignment: Alignment.center),
        SizedBox(height: 91.v),
        Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 180.h,
                child: Text("msg_connect_with_a_mentor".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge))),
        SizedBox(height: 4.v),
        Container(
            width: 296.h,
            margin: EdgeInsets.only(left: 1.h),
            child: Text("msg_learn_from_a_personalized".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBlack90001
                    .copyWith(height: 1.11))),
        SizedBox(height: 27.v),

      ],
    );
  }
}
