import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../Style/sizes.dart';
import '../Widgets/Loading.dart';
import '../Widgets/comparisonWidget.dart';
import '../Widgets/InternetConnectionWidget.dart';

import '../Apis/moviesApi.dart';
import '../Models/moviesModel.dart';

class ComparisonScreen extends StatefulWidget {
  final List<Movies> compareList;
  const ComparisonScreen({Key key, this.compareList}) : super(key: key);

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  Movies movieOne;
  Movies movieTwo;
  bool connection = true;

  Future<void> loadApi() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      connection = true;
      MoviesApi.getDetails(widget.compareList[0].id).then((value) {
        setState(() {
          movieOne = value;
        });
      });
      MoviesApi.getDetails(widget.compareList[1].id).then((value) {
        setState(() {
          movieTwo = value;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text("Movie Dorm"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return connection
            ? movieOne != null && movieTwo != null
                ? SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(
                            bottom: Sizes.vMarginMedium,
                            left: Sizes.vMarginSmall,
                            right: Sizes.vMarginSmall),
                        child: Column(
                          children: [
                            ComparisonWidget(movie: movieOne),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Sizes.vMarginSmall,
                                  horizontal: Sizes.vMarginMedium),
                              child: Divider(
                                color: Theme.of(context).colorScheme.secondary,
                                thickness: 2,
                                height: 3,
                              ),
                            ),
                            ComparisonWidget(movie: movieTwo),
                          ],
                        )),
                  )
                : const LoadingWidget()
            : InternetConnectionWidget(tabHandler: loadApi);
      }),
    );
  }
}
