import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/Screens/popularMovies.dart';
import 'package:movieapp/Screens/tv.dart';
import 'package:movieapp/wigets/Fonts.dart';
import 'package:movieapp/Screens/Tv_shows.dart';
import 'package:movieapp/wigets/courser.dart';
import 'package:movieapp/Screens/Trending.dart';
import 'package:movieapp/wigets/SideBar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement setState
    _controller.dispose();
  }

  // List trendingMovies = [];
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
      drawer: ExampleSidebarX(),
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(
              255, 168, 23, 31), // Set the desired icon color for the sidebar
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Color.fromARGB(255, 168, 23, 31),
          )
        ],
        backgroundColor: Color(0xFF141E30),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/MyTime.png',
              height: 50, width: MediaQuery.of(context).size.width),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<List<dynamic>>(
            future: trendingMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitFadingCircle(
                  color: Colors.amberAccent,
                  size: 50,
                  controller: _controller,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                //final List<dynamic> ratedMovies = snapshot.data!;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF141E30), // Deep red
                        // Colors.black, // Black

                        Color(0xFF243B55), // Slightly lighter red
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CarouselDemo(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Moviessss(),
                            Tv_Shows(
                              Tv_show: tv,
                            ),
                            popularMovies()
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
