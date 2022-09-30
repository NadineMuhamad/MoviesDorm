import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Style/sizes.dart';
import '../Apis/moviesApi.dart';
import '../Models/moviesModel.dart';

class UnfavoriteButton extends StatelessWidget {
  final int id;
  const UnfavoriteButton({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MoviesApi.markAsFavorite(id, false).then((value) {
          if (value == true) {
            Provider.of<Movies>(context, listen: false).removeFavorite(id);
          }
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xff7C7E87),
              content: Text(value == true
                  ? "Removed From Favorites Successfully"
                  : "Something Went Wrong"),
              duration: Duration(seconds: 2),
            ),
          );
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: Sizes.vMarginSmall),
        child: Icon(
          Icons.remove_circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
