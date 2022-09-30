import 'package:flutter/material.dart';

class Movies with ChangeNotifier {
  final int id;
  final String name;
  final String date;
  final String imageUrl;
  final String overview;
  final List<String> actors;
  final List<String> country;

  Movies({
    this.imageUrl,
    this.name,
    this.id,
    this.overview,
    this.date,
    this.actors,
    this.country,
  });

  factory Movies.fromJson(Map<String, dynamic> json,
      {Map<String, dynamic> actorsJson}) {
    List<String> country = [];
    List<String> actors = [];
    if (actorsJson != null) {
      Iterable countryList = json['production_companies'];
      for (var element in countryList) {
        country.add(element['origin_country']);
      }
      Iterable actorsList = actorsJson['cast'];
      for (var element in actorsList) {
        actors.add(element['name']);
      }
    }
    return actorsJson == null
        ? Movies(
            id: json['id'],
            overview: json['overview'],
            imageUrl: json['poster_path'],
            name: json['title'],
            date: json['release_date'],
          )
        : Movies(
            id: json['id'],
            overview: json['overview'],
            imageUrl: json['poster_path'],
            name: json['title'],
            date: json['release_date'],
            country: country,
            actors: actors,
          );
  }

  List<Movies> _comparisonList = [];
  List<Movies> _favoriteList = [];

  List<Movies> get comparisonList {
    return [..._comparisonList];
  }

  List<Movies> get favoriteList {
    return [..._favoriteList];
  }

  void addFavorite(List<Movies> movies) {
    _favoriteList = movies;
    notifyListeners();
  }

  void clearFavorites(List<Movies> movies) {
    _favoriteList = [];
    notifyListeners();
  }

  void removeFavorite(int id) {
    _favoriteList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addList(Movies movies) {
    if (_comparisonList.length < 2) {
      _comparisonList.add(movies);
    }
    notifyListeners();
  }

  void clearList() {
    _comparisonList = [];
    notifyListeners();
  }
}
