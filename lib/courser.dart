import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDemo extends StatefulWidget {
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  int _currentImageIndex = 0;
  final List<String> _imageUrls = [
    'https://www.peakpx.com/en/hd-wallpaper-desktop-ajgby',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.socialnews.xyz%2F2020%2F05%2F21%2Fthe-old-guard-movie-hd-poster%2F&psig=AOvVaw3ZwDYuVqQdbcysrl5cfZ7j&ust=1689752053556000&source=images&cd=vfe&opi=89978449&ved=0CA0QjRxqFwoTCIj8xorfl4ADFQAAAAAdAAAAABAJ',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.peakpx.com%2Fen%2Fhd-wallpaper-desktop-ajgby&psig=AOvVaw3ZwDYuVqQdbcysrl5cfZ7j&ust=1689752053556000&source=images&cd=vfe&opi=89978449&ved=0CA0QjRxqFwoTCIj8xorfl4ADFQAAAAAdAAAAABAR',
    // Add more image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
            items: _imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageUrls.map((url) {
              int index = _imageUrls.indexOf(url);
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
