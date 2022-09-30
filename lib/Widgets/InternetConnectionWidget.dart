import 'package:flutter/material.dart';

import '../Style/sizes.dart';
import 'ErrorTextWidget.dart';

class InternetConnectionWidget extends StatelessWidget {
  final Function tabHandler;
  const InternetConnectionWidget({Key key, this.tabHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ErrorTextWidget(
          errorText:
              "There is no internet connection, please connect to the internet and try again",
        ),
        GestureDetector(
          onTap: tabHandler,
          child: Container(
            margin: EdgeInsets.only(
                left: Sizes.vMarginMedium, right: Sizes.vMarginMedium),
            padding: EdgeInsets.all(Sizes.vPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Try Again",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.fontSizes['h4'],
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
