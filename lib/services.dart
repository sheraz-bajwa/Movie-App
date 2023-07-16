import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

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
            Text('TopRated Moviesss'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 150,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              movies[index]['poster_path']),
                                    ),
                                  ),
                                  height: 200,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 70,
                                  child: Text(
                                    movies[index]['title'] != null
                                        ? movies[index]['title']
                                        : ['loading'],
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
