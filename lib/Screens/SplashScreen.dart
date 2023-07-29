import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Screens/home1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 30, 30, 30),
      // ignore: avoid_unnecessary_containers
      body: Center(
          child: Lottie.asset(
        'assets/movie.json',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      )),
    );
  }
}
