import 'dart:convert';
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

Future<List<dynamic>> fetchEpisodeList() async {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/tv/550?api_key=30b971b8d022703bae6fe56e8de391d6');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["seasons"];
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

Future<List<dynamic>> trendingMovies() async {
  final String baseUrl = 'https://api.themoviedb.org/3/trending/all/week';
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

// Future<List<dynamic>> FavorateMovies() async {
//   final String baseUrl =
//       'https://api.themoviedb.org/4/account/64b1714b253fab0c3775118e/movie/favorites';
//   final String accessToken =
//       'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGI5NzFiOGQwMjI3MDNiYWU2ZmU1NmU4ZGUzOTFkNiIsInN1YiI6IjY0YjE3MTRiMjUzZmFiMGMzNzc1MTE4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eZiYr4LTWVDEwG-rBCQvUoUXRGLXMjP__z6CQC0l8dA';

//   final Uri uri = Uri.parse(baseUrl);
//   final Map<String, String> queryParams = {
//     'api_key': apiKey,
//     // You can add more parameters here to customize the request (e.g., language, page, etc.).
//   };
//   uri.replace(queryParameters: queryParams);

//   final response = await http.get(uri, headers: {
//     'Authorization': 'Bearer $accessToken',
//   });
//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body);
//     return jsonData['results'];
//   } else {
//     throw Exception('Failed to load movies');
//   }
// }

// Future<List<dynamic>> TV() async {
//     var url = Uri.parse(
//         'https://api.themoviedb.org/3/tv/550?api_key=30b971b8d022703bae6fe56e8de391d6');

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         //print(response.body);
//         var data = jsonDecode(response.body);
//         //final result = Currency.fromJson(data);
//         return data;
//       } else {
//         throw Exception('Request failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
