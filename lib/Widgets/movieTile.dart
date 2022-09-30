import 'package:flutter/material.dart';

import '../Widgets/compareButton.dart';
import '../Widgets/favoriteButton.dart';
import '../Widgets/unfavoriteButton.dart';

import '../main.dart';
import '../Style/sizes.dart';
import '../Models/moviesModel.dart';

class MovieTile extends StatefulWidget {
  final Movies movie;
  final int length;
  const MovieTile({Key key, this.movie, this.length}) : super(key: key);

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(
          top: Sizes.vMarginSmall,
          left: Sizes.vMarginSmall,
          right: Sizes.vMarginSmall),
      padding: EdgeInsets.symmetric(
          vertical: Sizes.vPadding, horizontal: Sizes.vPadding),
      child: Row(
        children: [
          widget.movie.imageUrl != null
              ? Image.network(
                  '$imageUrl${widget.movie.imageUrl}',
                  errorBuilder: (context, error, stackTrace) => Container(),
                  width: MediaQuery.of(context).size.width / 4,
                )
              : Container(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: Sizes.vMarginSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Sizes.vMarginSmallest,
                        bottom: Sizes.vMarginSmallest),
                    child: Text(
                      widget.movie.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.fontSizes['h4'],
                      ),
                    ),
                  ),
                  Text(
                    widget.movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.fontSizes['h4'],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.length != -1
                          ? FavoriteButton(id: widget.movie.id)
                          : UnfavoriteButton(id: widget.movie.id),
                      widget.length != -1
                          ? CompareButton(movie: widget.movie)
                          : Container()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
