import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizes {
  static const designHeight = 430.0;
  static const designWidth = 932.0;
  static get screenHeight => ScreenUtil().screenHeight;
  static get screenWidth => ScreenUtil().screenWidth;

  //Font sizes
  static get fontSizes => {
        "h1": 32.0.sp,
        "h2": 24.0.sp,
        "h3": 20.0.sp,
        "h4": 17.0.sp,
        "h5": 14.0.sp,
        "h6": 12.0.sp,
        "h8": 10.0.sp,
      };

  //Icons sizes
  static get iconsSizes => {
        "s1": 110.r,
        "s2": 70.r,
        "s3": 48.r,
        "s4": 32.r,
        "s5": 24.r,
        "s6": 19.r,
        "s7": 14.r,
      };

  //Text
  static get hPaddingText => 12.w;
  static get vPaddingText => 6.h;

  //Screens Padding
  static get screenVPaddingDefault => 20.h;
  static get screenHPaddingDefault => 30.w;

  //Widgets Padding
  static get vPaddingLarge => 60.h;
  static get vPaddingHighest => 40.h;
  static get vPaddingHigh => 30.h;
  static get vPaddingMediumLarge => 22.h;
  static get vPaddingMediumExtra => 18.h;
  static get vPaddingMedium => 16.h;
  static get vPadding => 10.h;
  static get vPaddingSmall => 8.h;
  static get vPaddingSmallest => 1.h;
  static get vPaddingTiny => 5.h;
  static get vPaddingExTiny => 6.h;
  static get hPaddingHighest => 40.w;
  static get hPaddingHigh => 30.w;
  static get hPaddingMedium => 22.w;
  static get hPaddingSmall => 8.w;
  static get hPaddingSmallest => 1.w;
  static get hPaddingTiny => 5.w;

  //Widgets Margin
  static get vMarginExtreme => 80.h;
  static get vMarginHighest => 40.h;
  static get vMarginHighMed => 35.h;
  static get vMarginHigh => 30.h;
  static get vMarginMedium => 22.h;
  static get vMarginSmall => 16.h;
  static get vMarginSmallest => 10.h;
  static get vMarginComment => 8.h;
  static get vMarginTiny => 5.h;
  static get vMarginDot => 3.h;
  static get hMarginExtreme => 70.w;
  static get hMarginHighest => 40.w;
  static get hMarginHigh => 30.w;
  static get hMarginMedium => 22.w;
  static get hMarginSmall => 16.w;
  static get hMarginSmallest => 10.w;
  static get hMarginComment => 8.w;
  static get hMarginTiny => 5.w;
  static get hMarginDot => 3.w;

  //Buttons
  static get roundedButtonMinHeight => 40.h;
  static get roundedButtonDefaultHeight => 50.h;
  static get roundedButtonDefaultWidth => 300.w;
  static get roundedButtonDefaultRadius => 26.r;
  static get roundedButtonDialogHeight => 44.h;
  static get roundedButtonDialogWidth => 240.w;
  static get roundedButtonMediumWidth => 180.w;
  static get roundedButtonSmallWidth => 116.w;
  static get roundedButtonSmallRadius => 14.r;
  static get textButtonMinWidth => 60.w;
  static get textButtonMinHeight => 34.h;

  //CheckBoxes
  static get checkBoxSpacing => 16.w;
  static get checkBoxSplashRadius => 18.r;

  //TextFields
  static get textFieldVMarginMedium => 20.h;
  static get textFieldHPaddingMedium => 16.w;
  static get textFieldVPaddingMedium => 16.h;

  //Cards
  static get cardVPadding => 16.h;
  static get cardHRadius => 20.w;
  static get cardRadius => 14.r;

  //Dialogs
  static get dialogVPadding => 30.h;
  static get dialogHPadding => 20.w;
  static get dialogRadius => 24.r;
  static get dialogSmallRadius => 6.r;

  //LoadingIndicators
  static get loadingAnimationDefaultHeight => 200.h;
  static get loadingAnimationDefaultWidth => 200.w;

  //Images
  static get noteImageHeight => 140.h;
  static get noteImageWidth => 140.h;
  static get noteImageRadius => 14.r;
  static get noteImageHighRadius => 66.r;
  static get statusCircleRadius => 14.r;
  static get pickedImageMaxSize => 400.r;

  //AppBar & Drawer
  static get appBarDefaultHeight => 60.h;
  static get appBarCustomizedHeigh => 120.h;
  static get mainDrawerWidth => 250.w;
  static get mainDrawerHPadding => 30.w;
  static get mainDrawerVPadding => 90.h;
  static get appBarIconSize => 26.r;
  static get snackBarRadius => 20.r;

  ///App Constants
  static get screenTopShadowHeight => 400.h;
  static get appLogosRadius => 500.r;
  static get splashLogoSize => 260.r;
  static get switchThemeButtonWidth => 44.w;
  static get noteItemMinHeight =>
      textButtonMinHeight + vMarginSmallest + noteImageHeight;
}
