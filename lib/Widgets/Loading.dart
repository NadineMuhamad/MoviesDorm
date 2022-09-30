import 'package:flutter/material.dart';

import '../Style/sizes.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: Sizes.vMarginMedium, bottom: Sizes.vMarginMedium),
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
