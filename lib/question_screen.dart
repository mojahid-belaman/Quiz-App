import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onAnswerQuestion, {super.key});

  final void Function(String answer) onAnswerQuestion;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswerQuestion(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentAnswer = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentAnswer.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 216, 216),
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ...currentAnswer.getShuffedList().map(
                  (item) => AnswerButton(
                    item,
                    () {
                      answerQuestion(item);
                    },
                  ),
                )
          ],
        ),
      ),
    );
  }
}
