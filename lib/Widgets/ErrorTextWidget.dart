import 'package:flutter/material.dart';

import '../Style/sizes.dart';

class ErrorTextWidget extends StatelessWidget {
  final String errorText;
  const ErrorTextWidget({Key key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: Sizes.vMarginMedium,
          bottom: Sizes.vMarginMedium,
          left: Sizes.vMarginMedium,
          right: Sizes.vMarginMedium),
      child: Text(
        errorText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.fontSizes['h4'],
        ),
      ),
    );
  }
}
