import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../Style/sizes.dart';
import './searchMovies.dart';
import '../Widgets/title.dart';
import '../Widgets/Loading.dart';
import '../Widgets/movieTile.dart';
import '../Widgets/clearCompare.dart';
import '../Widgets/moviesWidget.dart';
import '../Widgets/floatingButton.dart';
import '../Widgets/ErrorTextWidget.dart';
import '../Widgets/InternetConnectionWidget.dart';

import '../Apis/MoviesApi.dart';
import '../Models/moviesModel.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  Future<List<Movies>> popularMovies;
  Future<List<Movies>> commonMovies;
  Future<Movies> latestMovies;

  TextEditingController searchMovie = TextEditingController();
  bool connection = true;

  Future<void> loadApi() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      setState(() {
        connection = true;
        popularMovies = MoviesApi.getMovies("top_rated", 1);
        commonMovies = MoviesApi.getMovies("upcoming", 1);
        latestMovies = MoviesApi.getLatestMovies();
      });
    } else {
      setState(() {
        connection = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                popularMovies = MoviesApi.getMovies("top_rated", 1);
                commonMovies = MoviesApi.getMovies("upcoming", 1);
                latestMovies = MoviesApi.getLatestMovies();
              });
            },
            child: connection
                ? SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(bottom: Sizes.vMarginMedium),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Sizes.vMarginSmall,
                                  left: Sizes.vMarginSmall,
                                  right: Sizes.vMarginSmall),
                              child: TextFormField(
                                controller: searchMovie,
                                cursorColor:
                                    Theme.of(context).colorScheme.secondary,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: const Color(0xff7C7E87),
                                  filled: true,
                                  hintText: "Search for movie",
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        if (searchMovie.text.isNotEmpty) {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: ((context) => SearchScreen(
                                                  searchKey: searchMovie.text,
                                                )),
                                          ));
                                        }
                                      },
                                      child: Icon(Icons.search_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: Sizes.vMarginSmall,
                                  right: Sizes.vMarginSmall),
                              child: const ClearCompareButton(),
                            ),
                            FutureBuilder<List<Movies>>(
                              future: commonMovies,
                              builder: ((context, snapshot) {
                                return snapshot.hasData
                                    ? MoviesWidget(
                                        type: "Top Common Movies",
                                        constraints: constraints,
                                        trendingMovies: snapshot.data)
                                    : snapshot.connectionState ==
                                                ConnectionState.waiting ||
                                            snapshot.connectionState ==
                                                ConnectionState.none
                                        ? const LoadingWidget()
                                        : const ErrorTextWidget(
                                            errorText:
                                                "Sorry, Something went wrong while fetching the top common movies");
                              }),
                            ),
                            FutureBuilder<List<Movies>>(
                              future: popularMovies,
                              builder: ((context, snapshot) {
                                return snapshot.hasData
                                    ? MoviesWidget(
                                        type: "Top Rated Movies",
                                        constraints: constraints,
                                        trendingMovies: snapshot.data)
                                    : snapshot.connectionState ==
                                                ConnectionState.waiting ||
                                            snapshot.connectionState ==
                                                ConnectionState.none
                                        ? const LoadingWidget()
                                        : const ErrorTextWidget(
                                            errorText:
                                                "Sorry, Something went wrong while fetching the top rated movies");
                              }),
                            ),
                            FutureBuilder<Movies>(
                              future: latestMovies,
                              builder: ((context, snapshot) {
                                return snapshot.hasData
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: Sizes.vMarginSmall,
                                            bottom: Sizes.vMarginSmall),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: Sizes.vMarginSmall,
                                                  right: Sizes.vMarginSmall),
                                              child: const TitleWidget(
                                                  title: "Latest Movies"),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: Sizes.vMarginMedium,
                                                  left: Sizes.vMarginSmall,
                                                  right: Sizes.vMarginSmall),
                                              child: MovieTile(
                                                movie: snapshot.data,
                                              ),
                                            ),
                                          ],
                                        ))
                                    : snapshot.connectionState ==
                                                ConnectionState.waiting ||
                                            snapshot.connectionState ==
                                                ConnectionState.none
                                        ? const LoadingWidget()
                                        : const ErrorTextWidget(
                                            errorText:
                                                "Sorry, Something went wrong while fetching the latest movie");
                              }),
                            ),
                          ],
                        )),
                  )
                : InternetConnectionWidget(tabHandler: loadApi));
      }),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
