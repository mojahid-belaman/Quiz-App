import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/button_quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/ora-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'E-Morocco for everyone! Believers',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 253, 200, 200),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ButtonQuiz(
            'Start Quiz',
            startQuiz,
            icon: Icons.arrow_right_alt_outlined,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
