import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesdorm/TabsScreen.dart';
import 'package:provider/provider.dart';

import 'Models/moviesModel.dart';

var url = "https://api.themoviedb.org/3";
var imageUrl = "https://image.tmdb.org/t/p/original";
var apiKey = "923cebaec46912a94c9a6b0b96972e9e";
var sessionId = "8bb952484e05847dffdfa7b400a1929a429792a2";
var accountID = 15007319;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Movies()),
        ],
        builder: (context, child) {
          return ScreenUtilInit(
            designSize: const Size(430, 932),
            builder: (context, child) => MaterialApp(
              title: 'MovieDorm',
              theme: ThemeData(
                scaffoldBackgroundColor: const Color(0xff211e2d),
                primaryColor: const Color(0xff211e2d),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: const Color(0xff12cdda),
                  secondary: const Color(0xffff8801),
                ),
              ),
              home: const TabsScreen(),
            ),
          );
        });
  }
}
