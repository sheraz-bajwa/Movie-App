import 'package:flutter/material.dart';
import 'package:movieapp/Fonts.dart';

class Sider extends StatelessWidget {
  const Sider({super.key, required this.slider});
  final List slider;

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
                  itemCount: slider.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
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
                                            slider[index]['poster_path']),
                                  ),
                                ),
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Container(
                              //   height: 70,
                              //   child: text(
                              //       data: slider[index]['title'] != null
                              //           ? slider[index]['title']
                              //           : ['loading'],
                              //       color: Colors.white,
                              //       size: 20),
                              // )
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
