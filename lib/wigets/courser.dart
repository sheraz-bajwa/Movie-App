import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDemo extends StatefulWidget {
  final Imag;

  //final Currencyy;
  const CarouselDemo({
    super.key,
    required this.Imag,
    //required this.Currencyy,
  });
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  int _currentImageIndex = 0;
  // final List<String> _imageUrls = [
  //   'assets/movie4.jpg',
  //   'assets/peaky.jpg',
  //   'assets/Witcher.jpg',
  //   'assets/GOT.jpg',
  //   'assets/movie1.jpg',

  //   'assets/movie3.jpg',
  //   // Add more image URLs here
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 12,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
            items: widget.Imag.keys.toSet().toList().map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      url,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.Imag.keys.toSet().toList().map((url) {
              int index = widget.Imag.keys.toSet().toList().map.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentImageIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
