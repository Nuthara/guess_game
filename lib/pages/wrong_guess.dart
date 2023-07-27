import 'package:flutter/material.dart';
import 'package:guess_game/pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

class WrongGuess extends StatelessWidget {
  const WrongGuess({super.key, required int key1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffcce6"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sorry! wrong guess. Please Try Again",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                //go to home page (Go back)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Guess Again"),
            )
          ],
        ),
      ),
    );
  }
}
