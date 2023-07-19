import 'package:flutter/material.dart';
import 'package:movieapp/Fonts/Fonts.dart';
import 'package:movieapp/Screens/Tv_shows.dart';
import 'package:movieapp/Slider.dart';
import 'package:movieapp/courser.dart';
import 'package:movieapp/Screens/Top_Rated_Movies.dart';
import 'package:movieapp/Screens/Trending_Movies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List topratedmovies = [];
  List tv = [];

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
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getTopRated();
    print((tv));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 66, 74),
      drawer: DrawerButtonIcon(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Color.fromARGB(255, 168, 23, 31),
          )
        ],
        backgroundColor: Color.fromARGB(255, 39, 48, 55),
        title: text(data: 'MovieB', color: Colors.white, size: 30),
      ),
      body: ListView(
        children: [
          Tv_Shows(
            Tv_show: tv,
          ),
          TrendingMovies(
            trending: trendingmovies,
          ),
          Moviessss(
            movies: topratedmovies,
          ),
        ],
      ),
    );
  }
}
