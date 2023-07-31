import 'package:flutter/material.dart';
import 'package:movieapp/wigets/Fonts.dart';
import 'package:movieapp/description/discription.dart';

class Tv_Shows extends StatelessWidget {
  final List Tv_show;
  const Tv_Shows({super.key, required this.Tv_show});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(
              data: 'Popular Tv Shows',
              color: Colors.white,
              size: 30,
              Bold: FontWeight.bold,
            ),
            Container(
              height: 250,
              //height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Tv_show.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    // cast: '',
                                    img: 'https://image.tmdb.org/t/p/w500' +
                                        Tv_show[index]['backdrop_path'],
                                    story: Tv_show[index]['overview'] != null
                                        ? Tv_show[index]['overview']
                                        : 'loading',
                                    title:
                                        Tv_show[index]['original_name'] != null
                                            ? Tv_show[index]['original_name']
                                            : 'loading',
                                    lang: Tv_show[index]['original_language'] !=
                                            null
                                        ? Tv_show[index]['original_language']
                                        : 'loading',
                                    vote: Tv_show[index]['vote_average']
                                        .toString(),
                                    Date: Tv_show[index]['release_date']
                                        .toString(),
                                    img2: 'https://image.tmdb.org/t/p/w500' +
                                        Tv_show[index]['poster_path'],
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
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          Tv_show[index]['poster_path'],
                                    ),
                                  ),
                                ),
                                width: 300,
                                height: 150,
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 70,
                                child: text(
                                    data:
                                        Tv_show[index]['original_name'] != null
                                            ? Tv_show[index]['original_name']
                                            : 'loading',
                                    color: Colors.white,
                                    Bold: FontWeight.bold,
                                    size: 20),
                              ),
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
