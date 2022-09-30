import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Style/sizes.dart';
import '../Models/moviesModel.dart';

class CompareButton extends StatefulWidget {
  final Movies movie;
  const CompareButton({Key key, this.movie}) : super(key: key);

  @override
  State<CompareButton> createState() => _CompareButtonState();
}

class _CompareButtonState extends State<CompareButton> {
  FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var length = Provider.of<Movies>(context).comparisonList;
    return GestureDetector(
      onTap: () {
        if (length.length == 2) {
          fToast.showToast(
            toastDuration: Duration(seconds: 2),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff7C7E87),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.movie,
                        color: Colors.white,
                      ),
                      Text(
                        "You can only compare between two movies",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            gravity: ToastGravity.CENTER,
          );
        } else {
          Provider.of<Movies>(context, listen: false).addList(widget.movie);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(top: Sizes.vMarginSmallest),
        child: const Text(
          "Compare",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
