import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:quiz_app/data/qns.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelect});
  final void Function(String selectAns) onSelect;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;
  void onTap(String selectedAns){
    widget.onSelect(selectedAns);
    setState(() {
      currentIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final displayQn = questions[currentIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              displayQn.que,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...displayQn.shuffledAns().map((answer){
              return AnswerButton(text: answer,onTap: () {onTap(answer);});
            }),
        ],
        ),
      ),
    );
  }
}