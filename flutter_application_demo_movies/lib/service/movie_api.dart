import 'dart:convert';
import 'package:flutter_application_demo_movies/models/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<PopularMovie?> getPopular() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/movie/popular'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NjMyMGQ5MGI2NjFiYWE2YmE4ODdlNDA0YzZkNmU0MyIsIm5iZiI6MTU0OTMxNzU5MS4yNjgsInN1YiI6IjVjNThiNWQ3YzNhMzY4MzAyODg4NWZhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nWO-WkgQl76ftAZJlrlNN2mFxkxbWBGhTa8GTBehw30',
        },
      );

      if (response.statusCode == 200) {
        var popularMovies = PopularMovie.fromJson(jsonDecode(response.body));
        return popularMovies;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
