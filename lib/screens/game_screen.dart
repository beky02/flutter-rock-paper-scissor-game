import 'package:flutter/material.dart';
import 'package:rock_paper_scissor_game/components/game_pad.dart';
import 'package:rock_paper_scissor_game/components/rules_button.dart';
import 'package:rock_paper_scissor_game/components/score_board.dart';
import 'package:rock_paper_scissor_game/enums/choice.dart';
import 'package:rock_paper_scissor_game/screens/result_screen.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ])),
          child: ListView(
            children: [
              ScoreBoard(score: _score),
              const SizedBox(height: 140),
              // Setting the Game play pad
              GamePad(
                key: const Key("game-pad"),
                onUserSelect: (Choice choice) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                userChoice: choice,
                                score: _score,
                              ))).then((value) {
                    if (value is int) {
                      setState(() {
                        _score = value;
                      });
                    }
                  });
                },
              ),
              const SizedBox(height: 120),
              const RulesButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
