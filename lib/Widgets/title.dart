import 'package:flutter/material.dart';

import '../Style/sizes.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: Sizes.fontSizes['h3'],
      ),
    );
  }
}
