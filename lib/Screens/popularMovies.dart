import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/description/discription.dart';
import 'package:movieapp/wigets/Fonts.dart';

class popularMovies extends StatelessWidget {
  const popularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            data: 'Popular Moviesss',
            color: Colors.white,
            size: 30,
            Bold: FontWeight.bold,
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List? movies = snapshot.data;
                return Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      // cast: '',
                                      img: 'https://image.tmdb.org/t/p/w500' +
                                          movies[index]['backdrop_path'],
                                      story: movies[index]['overview'] != null
                                          ? movies[index]['overview']
                                          : ['loading'],
                                      title: movies[index]['title'] != null
                                          ? movies[index]['title']
                                          : ['loading'],
                                      lang: movies[index]
                                                  ['original_language'] !=
                                              null
                                          ? movies[index]['original_language']
                                          : ['loading'],
                                      vote: movies[index]['vote_average']
                                          .toString(),
                                      Date: movies[index]['release_date']
                                          .toString(),
                                      img2: 'https://image.tmdb.org/t/p/w500' +
                                          movies[index]['poster_path'],
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Colors.black
                            ),
                            //margin: EdgeInsets.all(10),
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
                                              movies![index]['poster_path']),
                                    ),
                                  ),
                                  width: 200,
                                  height: 200,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 70,
                                  child: text(
                                      data: movies[index]['title'],
                                      color: Colors.white,
                                      Bold: FontWeight.bold,
                                      size: 20),
                                )
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
