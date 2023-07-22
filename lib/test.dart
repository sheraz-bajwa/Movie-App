import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/wigets/Fonts.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          text(data: 'Popular Moviesss', color: Colors.white, size: 30),
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
                        onTap: () {},
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
