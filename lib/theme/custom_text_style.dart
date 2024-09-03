import 'package:flutter/material.dart';
import '../core/app_export.dart';


class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
      );
  static get bodyLargeInterBlack90001 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.black90001.withOpacity(0.39),
        fontSize: 17.fSize,
      );
  static get bodyLargeInterBlack90001_1 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.black90001,
      );
  static get bodyLargeInterGray600 => theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray600,
        fontSize: 19.fSize,
      );
  static get bodyLargeInterWhiteA700 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 17.fSize,
      );
  static get bodyMediumRoboto => theme.textTheme.bodyMedium!.roboto;
  static get bodyMediumRobotoIndigo900 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.indigo900,
        fontSize: 13.fSize,
      );
  static get bodyMediumRobotoLight =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumRobotoWhiteA700 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.whiteA700,
      );
  // Label text style
  static get labelLargeBlack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeRobotoBlack90001 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.black90001,
        fontSize: 12.fSize,
      );
  static get labelLargeRobotoBlack90001SemiBold =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.black90001.withOpacity(0.53),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeRobotoBlack90001_1 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.black90001,
      );
  static get labelLargeRobotoWhiteA700 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.whiteA700.withOpacity(0.6),
        fontSize: 12.fSize,
      );
  static get labelMediumBlack90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001.withOpacity(0.54),
      );
  // Title text style
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRoboto => theme.textTheme.titleLarge!.roboto.copyWith(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRobotoBold =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRobotoPrimary =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeRobotoWhiteA700 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeRobotoYellow80001 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.yellow80001,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumBlack9000118 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
      );
  static get titleMediumBlack90001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001.withOpacity(0.53),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90001Medium16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90001Medium16linkcolor =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepPurple600,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90001SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBlack90001_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterBlack90001 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.black90001.withOpacity(0.53),
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterBlack90001SemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.black90001,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumPrimaryMedium => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSecondaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSecondaryContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA70016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumYellowA200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.yellowA200,
      );
  static get titleSmallBlack90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack90001Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withOpacity(0.53),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack90001Medium_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack90001_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
       // color: theme.colorScheme.onPrimary,
    color: Colors.white
      );
  static get titleSmallOnPrimarywhite => theme.textTheme.titleSmall!.copyWith(
        color: Colors.white,
      );
  static get titleSmallRoboto => theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoBlack90001 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoMedium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoOnPrimaryContainer =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoOnSecondaryContainer =>
      theme.textTheme.titleSmall!.roboto.copyWith();
  static get titleSmallRobotoPrimary =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoWhiteA700 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700.withOpacity(0.6),
      );
  static get titleSmallYellowA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.yellowA200,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  // TextStyle get kaushanScript {
  //   return copyWith(
  //     fontFamily: 'Kaushan Script',
  //   );
  // }
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
