import 'package:flutter/material.dart';
import 'package:movieapp/trendingMovies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List trendingMovies = [];
  final String apiKeys = '30b971b8d022703bae6fe56e8de391d6';
  final readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGI5NzFiOGQwMjI3MDNiYWU2ZmU1NmU4ZGUzOTFkNiIsInN1YiI6IjY0YjE3MTRiMjUzZmFiMGMzNzc1MTE4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eZiYr4LTWVDEwG-rBCQvUoUXRGLXMjP__z6CQC0l8dA';
  List trendingmovies = [];
  // List topratedmovies = [];
  // List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKeys, readaccestoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    //Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
//      topratedmovies = topratedresult['results'];
      //tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingmovies,
          )
        ],
      ),
    );
  }
}
