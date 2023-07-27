import 'package:flutter/material.dart';
import 'package:guess_game/pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

class GameOver extends StatefulWidget {
  int key2;
  GameOver({super.key, required this.key2});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {

  late int rightNum;

  @override
  void initState() {
    super.initState();
    rightNum = widget.key2; // Access the constructor data and assign it to dataxx
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Guess Game")),
      ),
      backgroundColor: HexColor("#cce6ff"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sorry! Game Over. My secrete number is",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //Correct number display here
            Text('$rightNum'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
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