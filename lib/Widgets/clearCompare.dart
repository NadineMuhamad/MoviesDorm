import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Style/sizes.dart';
import '../Models/moviesModel.dart';

class ClearCompareButton extends StatelessWidget {
  const ClearCompareButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Movies>(context, listen: false).clearList();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(top: Sizes.vMarginSmallest),
        child: const Text(
          "Clear Compare",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
