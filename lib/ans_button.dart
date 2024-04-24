import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});
  
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
       onPressed: onTap,
       style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 6, 3, 46),
       ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
         child: Text(
          text,
         ),
       ),
       ),
    );
  }
}