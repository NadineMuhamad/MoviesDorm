import 'package:flutter/material.dart';
import 'package:moviesdorm/Models/moviesModel.dart';

import '../main.dart';
import '../Style/sizes.dart';

class ComparisonWidget extends StatelessWidget {
  final Movies movie;
  const ComparisonWidget({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            movie.imageUrl != null
                ? Image.network(
                    '$imageUrl${movie.imageUrl}',
                    width: MediaQuery.of(context).size.width / 4,
                  )
                : Container(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: Sizes.vMarginSmall, right: Sizes.vMarginSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.fontSizes['h3']),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Sizes.vMarginSmallest),
                      child: Text(movie.date,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Sizes.vMarginSmallest),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: movie.country
                            .map(
                              (i) => Text(
                                "$i ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: Sizes.vMarginSmallest),
          child: Wrap(
            direction: Axis.horizontal,
            children: movie.actors
                .map(
                  (i) => Text(
                    "$i,",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
