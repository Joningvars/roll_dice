import 'package:flutter/material.dart';
import 'dart:math';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _rollDiceState();
}

class _rollDiceState extends State<RollDice> {
  var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    var diceRoll = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          '🎲 🎲 🎲 🎲',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1635173250597-00863d9ce454?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                activeDiceImage,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[500],
                      foregroundColor: Colors.black,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  onPressed: rollDice,
                  child: const Text('Roll Dice!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
