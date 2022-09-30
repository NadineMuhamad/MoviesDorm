import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Widgets/title.dart';
import '../Widgets/compareButton.dart';
import '../Widgets/favoriteButton.dart';

import '../Models/moviesModel.dart';
import '../main.dart';
import '../Style/sizes.dart';

class MoviesWidget extends StatefulWidget {
  final List<Movies> trendingMovies;
  final BoxConstraints constraints;
  final String type;
  const MoviesWidget(
      {Key key, this.constraints, this.trendingMovies, this.type})
      : super(key: key);

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // print(widget.trendingMovies[0].imageUrl);
    var orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: Sizes.vMarginMedium,
              left: Sizes.vMarginSmall,
              bottom: Sizes.vMarginMedium),
          child: TitleWidget(title: widget.type),
        ),
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
              height: orientation == Orientation.portrait
                  ? widget.constraints.maxWidth / 2.5
                  : widget.constraints.maxWidth / 4,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Image.network(
                    "$imageUrl${widget.trendingMovies[index].imageUrl}",
                    fit: BoxFit.fill,
                    height: widget.constraints.maxWidth / 2.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.black54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Sizes.vMarginSmall,
                                top: Sizes.vMarginSmall,
                                bottom: Sizes.vMarginSmall),
                            child: Text(
                              widget.trendingMovies[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Sizes.vMarginSmallest,
                                  // bottom: Sizes.vMarginSmallest,
                                  left: Sizes.vMarginSmall,
                                  right: Sizes.vMarginSmall),
                              child: FavoriteButton(
                                  id: widget.trendingMovies[index].id),
                            ),
                            CompareButton(movie: widget.trendingMovies[index]),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(
              left: Sizes.vMarginSmall, right: Sizes.vMarginSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: previous,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Sizes.vMarginSmall),
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: Sizes.vMarginSmall),
                child: AnimatedSmoothIndicator(
                  onDotClicked: slideToDot,
                  activeIndex: activeIndex,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white,
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: next,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Sizes.vMarginSmall),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void next() =>
      carouselController.nextPage(duration: const Duration(milliseconds: 500));
  void previous() => carouselController.previousPage(
      duration: const Duration(milliseconds: 500));
  void slideToDot(int index) => carouselController.animateToPage(index,
      duration: const Duration(milliseconds: 500));
}
