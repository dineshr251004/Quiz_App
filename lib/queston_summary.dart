import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.data});
  final List<Map<String, Object>> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((qn) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (qn['user_ans'] == qn['crct_ans']) ? Colors.green : Colors.red,
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    ((qn['qn_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(qn['qn'].toString(),
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(qn['crct_ans'].toString(),
                       style: const TextStyle(
                        color: Colors.white,
                       ),
                      ),
                      Text(qn['user_ans'].toString(),
                       style: const TextStyle(
                        color: Color.fromARGB(172, 0, 0, 0),
                       ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                )
              ],
            );
          },).toList(),
        ),
      ),
    );
  }
}
