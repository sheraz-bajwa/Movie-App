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
                        child: Container(
                          height: 150,
                          child: Column(
                            children: [
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
                              // Container(
                              //   height: 200,
                              //   decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //           image: NetworkImage(
                              //               'https://image.tmbd.org/t/p/w500' +
                              //                   trending[index]['poster_path']))),
                              // )
                            ],
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
