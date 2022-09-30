import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/moviesModel.dart';
import '../Screens/comparisonScreen.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comparisonList = Provider.of<Movies>(context).comparisonList;

    return FloatingActionButton(
      onPressed: () {
        if (comparisonList.length == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) =>
                  ComparisonScreen(compareList: comparisonList)),
            ),
          );
        }
      },
      child: Stack(
        children: <Widget>[
          const Icon(Icons.compare),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                '${comparisonList.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
