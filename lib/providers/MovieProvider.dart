import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Movie.dart';
import '../models/Actor.dart';

class MovieProvider extends ChangeNotifier {
  final String _apiKey = '96252f8952f61ec089e42528d1663d88';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  List<Movie> _popularMovies = [];
  bool _isLoading = true;
  bool _isFetchingMore = false;
  int _currentPage = 1;

  List<Movie> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;

  Future<void> getPopularMovies() async {
    if (_isFetchingMore || (_isLoading && _popularMovies.isNotEmpty)) return;

    if (_currentPage == 1) {
      _isLoading = true;
      notifyListeners();
    } else {
      _isFetchingMore = true;
      notifyListeners();
    }

    try {
      final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=es-ES&page=$_currentPage');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> results = decodedData['results'];
        
        final newMovies = results.map((movieJson) => Movie.fromJson(movieJson)).toList();

        if (_currentPage == 1) {
          _popularMovies = newMovies;
        } else {
          _popularMovies.addAll(newMovies);
        }
        
        _currentPage++;
      } else {
        debugPrint('Error obteniendo películas: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepción en getPopularMovies: $e');
    } finally {
      _isLoading = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<List<Actor>> getMovieCast(int movieId) async {
    try {
      final url = Uri.parse('$_baseUrl/movie/$movieId/credits?api_key=$_apiKey&language=es-ES');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> castList = decodedData['cast'];
        
        return castList.map((actorJson) => Actor.fromJson(actorJson)).toList();
      } else {
        debugPrint('Error obteniendo reparto: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Excepción en getMovieCast: $e');
      return [];
    }
  }
}
