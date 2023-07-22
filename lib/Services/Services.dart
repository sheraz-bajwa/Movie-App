import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String apiKey = '30b971b8d022703bae6fe56e8de391d6';

Future<List<dynamic>> fetchMovies() async {
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGI5NzFiOGQwMjI3MDNiYWU2ZmU1NmU4ZGUzOTFkNiIsInN1YiI6IjY0YjE3MTRiMjUzZmFiMGMzNzc1MTE4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eZiYr4LTWVDEwG-rBCQvUoUXRGLXMjP__z6CQC0l8dA';

  final Uri uri = Uri.parse(baseUrl);
  final Map<String, String> queryParams = {
    'api_key': apiKey,
    // You can add more parameters here to customize the request (e.g., language, page, etc.).
  };
  uri.replace(queryParameters: queryParams);

  final response = await http.get(uri, headers: {
    'Authorization': 'Bearer $accessToken',
  });

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load movies');
  }
}
