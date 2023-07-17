import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  const text(
      {super.key, required this.data, required this.color, required this.size});
  final String data;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: GoogleFonts.vollkorn(
          color: color,
          fontSize: size,
        ));
  }
}
