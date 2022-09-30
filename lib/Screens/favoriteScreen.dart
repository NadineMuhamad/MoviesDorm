import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../Style/sizes.dart';
import '../Widgets/Loading.dart';
import '../Widgets/movieTile.dart';
import '../Widgets/InternetConnectionWidget.dart';

import '../Apis/moviesApi.dart';
import '../Models/moviesModel.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isLoading = true;
  bool connection = true;

  Future<void> loadApi() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      MoviesApi.getFavoriteMovies().then((value) {
        setState(() {
          connection = true;
          Provider.of<Movies>(context, listen: false).addFavorite(value);
          isLoading = false;
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
    // TODO: implement initState
    super.initState();
    loadApi();
  }

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Movies>(context).favoriteList;
    return connection
        ? isLoading == false && favorites.isNotEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: ((context, index) {
                    return MovieTile(
                      movie: favorites[index],
                      length: -1,
                    );
                  }),
                );
              })
            : isLoading == true
                ? const LoadingWidget()
                : Center(
                    child: Text(
                      "You don't have favorites",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.fontSizes['h4'],
                      ),
                    ),
                  )
        : InternetConnectionWidget(tabHandler: loadApi);
  }
}
