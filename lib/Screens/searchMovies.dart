import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../Style/sizes.dart';
import '../Widgets/Loading.dart';
import '../Widgets/movieTile.dart';
import '../Widgets/clearCompare.dart';
import '../Widgets/floatingButton.dart';
import '../Widgets/InternetConnectionWidget.dart';

import '../Apis/MoviesApi.dart';
import '../Models/moviesModel.dart';

class SearchScreen extends StatefulWidget {
  final String searchKey;
  const SearchScreen({Key key, this.searchKey}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<List<Movies>> latestMovies;
  bool connection = true;

  Future<void> loadApi() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      setState(() {
        connection = true;
      });
      MoviesApi.getFavoriteMovies().then((value) {
        setState(() {
          latestMovies = MoviesApi.searchMovie(widget.searchKey);
        });
      });
    } else {
      setState(() {
        connection = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadApi();
  }

  @override
  Widget build(BuildContext context) {
    var length = Provider.of<Movies>(context).comparisonList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text("Movie Dorm"),
      ),
      body: connection
          ? FutureBuilder<List<Movies>>(
              future: latestMovies,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? LayoutBuilder(builder: (context, constraints) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Sizes.vMarginSmall,
                                        left: Sizes.vMarginSmall,
                                        right: Sizes.vMarginSmall),
                                    child: ClearCompareButton(),
                                  ),
                                ],
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (context, index) => MovieTile(
                                movie: snapshot.data[index],
                                length: length.length,
                              ),
                              childCount: snapshot.data.length,
                            )),
                          ],
                        );
                      })
                    : const LoadingWidget();
              })
          : InternetConnectionWidget(tabHandler: loadApi),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
