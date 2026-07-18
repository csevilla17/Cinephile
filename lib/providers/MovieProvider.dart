import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Movie.dart';

class MovieProvider extends ChangeNotifier {
  final String _apiKey = '96252f8952f61ec089e42528d1663d88';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  List<Movie> _popularMovies = [];
  bool _isLoading = true;

  List<Movie> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;

  Future<void> getPopularMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=es-ES');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> results = decodedData['results'];
        
        _popularMovies = results.map((movieJson) => Movie.fromJson(movieJson)).toList();
      } else {
        debugPrint('Error obteniendo películas: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepción en getPopularMovies: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
