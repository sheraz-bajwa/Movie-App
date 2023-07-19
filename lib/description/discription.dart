import 'package:flutter/material.dart';
import 'package:movieapp/Fonts/Fonts.dart';

class Description extends StatefulWidget {
  String img, img2;
  String title;
  String story, lang;
  String vote, Date;

  Description({
    super.key,
    required this.Date,
    required this.img2,
    required this.vote,
    required this.img,
    required this.title,
    required this.lang,
    required this.story,
  });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(
          data: widget.title,
          color: Colors.white,
          size: 30,
          Bold: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 49, 66, 74),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 49, 66, 74),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        widget.img,
                        //height: 300,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 140,
                        right: 5,
                        child: Row(
                          children: [
                            text(
                                data: 'Rating:  ',
                                color: Colors.white,
                                size: 20),
                            text(
                                data: widget.vote.toString(),
                                color: Colors.white,
                                size: 20),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        //right: 5,
                        left: 5,
                        child: Image.network(
                          widget.img2,
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    text(data: 'Relese on - ', color: Colors.white, size: 25),
                    text(
                        data: widget.Date.toString(),
                        color: Colors.white,
                        size: 20),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    text(data: 'language:  ', color: Colors.white, size: 25),
                    text(data: widget.lang, color: Colors.white, size: 25),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                text(data: 'Story:  ', color: Colors.white, size: 25),
                SizedBox(
                  height: 10,
                ),
                text(data: widget.story, color: Colors.white, size: 20)
              ],
            )),
      ),
    );
  }
}
