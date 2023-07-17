import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('trending Moviesss'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trending.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            //margin: EdgeInsets.all(10),
                            height: 150,
                            width: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path']),
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
                                  child: Text(
                                    trending[index]['title'] != null
                                        ? trending[index]['title']
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
