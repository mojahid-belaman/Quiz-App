import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswer, this.onResetQuiz, {super.key});

  final List<String> chosenAnswer;
  final void Function() onResetQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryList = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryList.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summaryList;
  }

  @override
  Widget build(context) {
    int numOfQuestion = questions.length;
    int numOfAnswers = getSummaryData()
        .where(
            (summary) => summary['question_answer'] == summary['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 253, 200, 200),
                    fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(text: 'You Answered  '),
                  TextSpan(
                      text: '$numOfAnswers ',
                      style: const TextStyle(color: Colors.green)),
                  const TextSpan(text: 'Out Of '),
                  TextSpan(
                      text: '$numOfQuestion ',
                      style: const TextStyle(color: Colors.green)),
                  const TextSpan(text: 'Questions Correctly!'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: () {
                chosenAnswer.clear();
                onResetQuiz();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.green,
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.green,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
