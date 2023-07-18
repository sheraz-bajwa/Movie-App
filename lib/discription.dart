import 'package:flutter/material.dart';
import 'package:movieapp/Fonts.dart';

class Description extends StatefulWidget {
  String img;
  String title;
  String story, lang;
  //double vote, Date;

  Description({
    super.key,
    // required this.Date,
    // required this.vote,
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
        backgroundColor: Color.fromARGB(255, 49, 66, 74),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 49, 66, 74),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(data: widget.title, color: Colors.white, size: 20),
                Image.network(
                  widget.img,
                  height: 300,
                  width: double.infinity,
                ),
                text(data: 'Story', color: Colors.white, size: 20),
                text(data: widget.story, color: Colors.white, size: 15),
                text(data: 'Language', color: Colors.white, size: 20),
                text(data: widget.lang, color: Colors.white, size: 20),
                // text(data: 'Rating', color: Colors.white, size: 20),
                // text(
                //     data: widget.vote.toString(), color: Colors.white, size: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
