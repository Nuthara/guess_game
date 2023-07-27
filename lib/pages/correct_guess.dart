import 'package:flutter/material.dart';
import 'package:guess_game/pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

class CorrectGuess extends StatefulWidget {
  int data;
  CorrectGuess({super.key, required this.data});

  @override
  State<CorrectGuess> createState() => _RightGuessState();
}

class _RightGuessState extends State<CorrectGuess> {
  int dataxx = 0;

  @override
  void initState() {
    super.initState();
    dataxx = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#b3ffd9"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulations! You've guessed it correctly. The number is",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //Guessed number in here
            Text('$dataxx'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                //go to home page (Push replacement)
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Start the Game Again"),
            )
          ],
        ),
      ),
    );
  }
}