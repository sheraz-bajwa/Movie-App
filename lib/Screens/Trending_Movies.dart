import 'package:flutter/material.dart';
import 'package:movieapp/wigets/Fonts.dart';
import 'package:movieapp/description/discription.dart';

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
            text(data: 'Trending Moviesss', color: Colors.white, size: 30),
            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    // cast: '',
                                    img: 'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['backdrop_path'],
                                    story: trending[index]['overview'] != null
                                        ? trending[index]['overview']
                                        : ['loading'],
                                    title: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : ['loading'],
                                    lang: trending[index]
                                                ['original_language'] !=
                                            null
                                        ? trending[index]['original_language']
                                        : ['loading'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    Date: trending[index]['release_date']
                                        .toString(),
                                    img2: 'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          //margin: EdgeInsets.all(10),
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
                                child: text(
                                    data: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : ['loading'],
                                    color: Colors.white,
                                    size: 20),
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
