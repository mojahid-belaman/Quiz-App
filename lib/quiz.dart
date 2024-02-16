import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> answerQuestion = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    answerQuestion.add(answer);

    if (answerQuestion.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      answerQuestion = [];
      activeScreen = 'start-screen';
    });
  }

  Widget getActiveScreen() {
    switch (activeScreen) {
      case "start-screen":
        return StartScreen(
          switchScreen,
        );
      case "question-screen":
        return QuestionScreen(chooseAnswer);
      case 'results-screen':
        return ResultsScreen(answerQuestion, resetQuiz);
      default:
        return const Text('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 158, 50, 50),
                Color.fromARGB(255, 237, 79, 79)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: getActiveScreen(),
        ),
      ),
    );
  }
}
