import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/wigets/Fonts.dart';
import 'package:movieapp/description/discription.dart';

class Moviessss extends StatelessWidget {
  //final List movies;
  const Moviessss({
    super.key,
    //required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(data: 'Trending this week', color: Colors.white, size: 30),
          FutureBuilder<List<dynamic>>(
            future: trendingMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List<dynamic> ratedMovies = snapshot.data!;
                return Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ratedMovies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      // cast: '',
                                      img: 'https://image.tmdb.org/t/p/w500' +
                                          ratedMovies[index]['backdrop_path'],
                                      story:
                                          ratedMovies[index]['overview'] != null
                                              ? ratedMovies[index]['overview']
                                              : ['loading'],
                                      title: ratedMovies[index]['title'] != null
                                          ? ratedMovies[index]['title']
                                          : ['loading'],
                                      lang: ratedMovies[index]
                                                  ['original_language'] !=
                                              null
                                          ? ratedMovies[index]
                                              ['original_language']
                                          : ['loading'],
                                      vote: ratedMovies[index]['vote_average']
                                          .toString(),
                                      Date: ratedMovies[index]['release_date']
                                          .toString(),
                                      img2: 'https://image.tmdb.org/t/p/w500' +
                                          ratedMovies[index]['poster_path'],
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: Colors.black,
                            ),
                            height: 150,
                            width: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            ratedMovies[index]['poster_path'],
                                      ),
                                    ),
                                  ),
                                  width: 200,
                                  height: 200,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 70,
                                  child: Text(
                                    ratedMovies[index]['title'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
