import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonQuiz extends StatelessWidget {
  const ButtonQuiz(this.text, this.onPressed,
      {super.key, this.icon, this.color});

  final String text;
  final IconData? icon;
  final Color? color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      icon: Icon(
        icon,
        color: color,
      ),
      label: Text(
        text,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.green,
            fontSize: 16),
      ),
    );
  }
}
