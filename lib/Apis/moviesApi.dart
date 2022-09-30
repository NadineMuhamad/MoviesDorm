import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/moviesModel.dart';
import '../main.dart';

class MoviesApi {
  static Future<List<Movies>> getMovies(String type, int page) async {
    final response = await http
        .get(Uri.parse('$url/movie/$type?api_key=$apiKey&page=$page'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Iterable moviesList = json['results'];
      List<Movies> movies =
          List<Movies>.from(moviesList.map((movie) => Movies.fromJson(movie)));
      return movies;
    } else {
      return Future.error("Error");
    }
  }

  static Future<Movies> getLatestMovies() async {
    final response =
        await http.get(Uri.parse('$url/movie/latest?api_key=$apiKey&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print(json['title']);
      return Movies.fromJson(json);
    } else {
      return Future.error("Error");
    }
  }

  static Future<Movies> getDetails(int id) async {
    final responses = await Future.wait([
      http.get(
        Uri.parse("$url/movie/$id?api_key=$apiKey"),
      ),
      http.get(
        Uri.parse("$url/movie/$id/credits?api_key=$apiKey"),
      ),
    ]);
    if (responses[0].statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(responses[0].body);
      Map<String, dynamic> actorsJson = jsonDecode(responses[1].body);
      return Movies.fromJson(json, actorsJson: actorsJson);
    } else {
      return Future.error("Error");
    }
  }

  static Future<List<Movies>> searchMovie(String movie) async {
    final response = await http
        .get(Uri.parse('$url/search/movie?api_key=$apiKey&query=$movie'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Iterable moviesList = json['results'];
      List<Movies> movies =
          List<Movies>.from(moviesList.map((movie) => Movies.fromJson(movie)));
      return movies;
    } else {
      return Future.error("Error");
    }
  }

  static Future<bool> markAsFavorite(int id, bool favorite) async {
    final response = await http.post(
        Uri.parse(
          'https://api.themoviedb.org/3/account/$accountID/favorite?api_key=$apiKey&session_id=$sessionId',
        ),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
        },
        body: json.encode({
          "media_type": "movie",
          "media_id": id,
          "favorite": favorite,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      var success = jsonDecode(response.body)['success'];
      if (success == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<List<Movies>> getFavoriteMovies() async {
    final response = await http.get(Uri.parse(
        '$url/account/$accountID/favorite/movies?api_key=$apiKey&session_id=$sessionId&language=en-US&sort_by=created_at.asc&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Iterable moviesList = json['results'];
      List<Movies> movies =
          List<Movies>.from(moviesList.map((movie) => Movies.fromJson(movie)));
      return movies;
    } else {
      return Future.error("Error");
    }
  }
}
