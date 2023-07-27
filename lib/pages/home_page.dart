import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guess_game/pages/correct_guess.dart';
import 'package:guess_game/pages/game_over.dart';
import 'package:guess_game/pages/wrong_guess.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}
int myNumber = 0;
int counter = 0;

class _HomePageState extends State<HomePage> {
  
  int randomNumber = generateRandomNumber(1, 10);
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Guess Game",
        ),),
      ),
      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/guess_game.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "I have a secret number in my mind. Can you Guess it? (1-10)",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$counter of 3 chances are taken",
              style: const TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    myNumber = int.tryParse(text) ?? 0;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Colors.black), // Change the border color here
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (randomNumber == myNumber) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CorrectGuess(data: randomNumber)));
                } else {
                  setState(() {
                    counter++;
                  });
                  if (counter > 2) {
                    counter = 0;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameOver(
                            key2: randomNumber,
                          ),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WrongGuess(key1: randomNumber)));
                  }
                }
              },
              child: const Text("Guess"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  static int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }
}