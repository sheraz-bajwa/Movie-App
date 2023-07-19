import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  const text(
      {super.key,
      required this.data,
      required this.color,
      required this.size,
      this.Bold});
  final String data;
  final Color color;
  final double size;
  final Bold;
  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: GoogleFonts.ebGaramond(
          color: color,
          fontSize: size,
          fontWeight: Bold,
        ));
  }
}
