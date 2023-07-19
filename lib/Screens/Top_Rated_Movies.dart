import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:movieapp/Fonts/Fonts.dart';
import 'package:movieapp/description/discription.dart';

class Moviessss extends StatelessWidget {
  final List movies;
  const Moviessss({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(data: 'TopRated Moviesss', color: Colors.white, size: 30),
            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
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
                                    lang: movies[index]['original_language'] !=
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
                              color: Colors.black),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            movies[index]['poster_path']),
                                  ),
                                ),
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 70,
                                child: text(
                                    data: movies[index]['title'] != null
                                        ? movies[index]['title']
                                        : ['loading'],
                                    color: Colors.white,
                                    size: 20),
                                // Text(
                                //   trending[index]['title'] != null
                                //       ? trending[index]['title']
                                //       : ['loading'],
                                //   style: TextStyle(
                                //       color: Colors.amber, fontSize: 20),
                                // ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
