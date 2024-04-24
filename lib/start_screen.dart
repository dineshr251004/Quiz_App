import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.screen, {super.key});
  final void Function() screen;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
              'assets/cricket.png',
              height: 300,
              width: double.infinity,
              color:const Color.fromARGB(167, 255, 255, 6),
            ),
            const SizedBox(height: 30),
            const Text('Lets delve into the world of cricket..',
             style: TextStyle(
              fontSize: 20,
             ),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
            onPressed: screen,
            style: OutlinedButton.styleFrom(
              foregroundColor:const Color.fromARGB(255, 9, 255, 251),
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_rounded),
            ),
          ],)
        )
      ),
    );
  }
}