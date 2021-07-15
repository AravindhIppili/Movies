import 'dart:convert';

import 'package:movies/data/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> getData() async {
  var url = Uri.parse('https://hoblist.com/movieList');
  var response = await http.post(url, body: {
    'category': 'movies',
    'language': 'hindi',
    'genre': 'all',
    'sort': 'voting'
  });
  var jsonData = jsonDecode(response.body)["result"];
  List<Movie> moviesList = [];
  for (var i = 0; i < jsonData.length; i++) {
    moviesList.add(Movie.fromJson(jsonData[i]));
  }

  return moviesList;
}
