import 'package:flutter/material.dart';
import 'package:quiz_app/data/qns.dart';
import 'package:quiz_app/qns_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizState extends StatefulWidget {
  const QuizState({super.key});

  @override
  State<QuizState> createState() => _QuizStateState();
}

class _QuizStateState extends State<QuizState> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];
  void chooseAnswer(String answerSelect){
    selectedAnswer.add(answerSelect);
    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = ResultScreen(chosenAnswer: selectedAnswer,onPress: onPress);
      });
    }
  }
  void onPress(){
    setState(() {
      selectedAnswer = [];
      activeScreen = StartScreen(change);
    });
  }
  @override
  void initState() {
    activeScreen = StartScreen(change);
    super.initState();
  }

  void change(){
    setState(() {
      activeScreen = QuestionScreen(onSelect: chooseAnswer);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 6, 166, 246),
              Color.fromARGB(255, 8, 25, 209),
            ]),
          ),
          child: activeScreen,
        ),
      )
    );
  }
}