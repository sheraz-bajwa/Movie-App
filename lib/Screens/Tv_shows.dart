import 'package:flutter/material.dart';

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
            text(data: 'Popular Tv Shows', color: Colors.white, size: 30),
            Container(
              height: 220,
              //height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Tv_show.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            Tv_show[index]['poster_path']),
                                  ),
                                ),
                                height: 200,
                                width: 200,
                              ),

                              // Container(
                              //   height: 70,
                              //   child: text(
                              //       data: Tv_show[index]['title'] != null
                              //           ? Tv_show[index]['title']
                              //           : ['loading'],
                              //       color: Colors.white,
                              //       size: 20),
                              //   // Text(
                              //   //   trending[index]['title'] != null
                              //   //       ? trending[index]['title']
                              //   //       : ['loading'],
                              //   //   style: TextStyle(
                              //   //       color: Colors.amber, fontSize: 20),
                              //   // ),
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
