import 'package:flutter/material.dart';
import 'package:quiz_app/data/qns.dart';
import 'package:quiz_app/queston_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.chosenAnswer,required this.onPress});
  final List<String> chosenAnswer;
  final void Function() onPress;
  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summary = [];
    for(int i = 0 ; i < chosenAnswer.length ; i++){
      summary.add({
        'qn_index': i,
        'qn': questions[i].que,
        'crct_ans': questions[i].ans[0],
        'user_ans': chosenAnswer[i],
      }
      );
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final qnLength = questions.length;
    final noCrctQn = summaryData.where((data){
      return data['user_ans'] == data['crct_ans'];
    }).length;
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Results..',
             style: TextStyle(
              color: Color.fromARGB(255, 0, 248, 91),
              fontSize: 28,
             ),
             textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            Text('You answered $noCrctQn out of $qnLength..!!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),          
            ),
            const SizedBox(height: 20,),
            QuestionSummary(data: summaryData),
            const SizedBox(height: 30,),
            ElevatedButton.icon(onPressed: onPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              foregroundColor: const Color.fromARGB(255, 9, 255, 251),
            ),
            icon: const Icon(Icons.restart_alt_rounded), 
            label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}