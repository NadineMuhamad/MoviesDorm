import 'package:flutter/material.dart';

import '../Apis/moviesApi.dart';

class FavoriteButton extends StatelessWidget {
  final int id;
  const FavoriteButton({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MoviesApi.markAsFavorite(id, true).then((value) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xff7C7E87),
              content: Text(value == true
                  ? "Added To Favorites Successfully"
                  : "Something Went Wrong"),
              duration: Duration(seconds: 2),
            ),
          );
        });
      },
      child: Icon(
        Icons.favorite,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
