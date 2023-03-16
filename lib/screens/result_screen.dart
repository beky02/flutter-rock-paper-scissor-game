import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rock_paper_scissor_game/components/game_button.dart';
import 'package:rock_paper_scissor_game/components/rules_button.dart';
import 'package:rock_paper_scissor_game/components/score_board.dart';
import 'package:rock_paper_scissor_game/enums/choice.dart';
import 'package:rock_paper_scissor_game/enums/game_result_status.dart';
import 'package:rock_paper_scissor_game/model/game_model.dart';

/// Result screen for a game
///
/// shows who is the winner

class ResultScreen extends StatefulWidget {
  final Choice userChoice;
  final int score;
  const ResultScreen({Key? key, required this.userChoice, required this.score})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Choice? compChoice;
  final GameModel _gameModel = GameModel();
  GameResultStatus? _status;

  /// Generate random choice for computer
  ///
  /// will find who win the game and update the score

  void _companyChoice() {
    Random random = Random();
    int randNumber = random.nextInt(5);
    compChoice = _gameModel.choices[randNumber];

    if (mounted) {
      _status = _gameModel.checkGameWinner(
          userChoice: widget.userChoice, compChoice: compChoice!);
      if (_status == GameResultStatus.win) {
        _gameModel.score++;
      } else if (_status == GameResultStatus.lose) {
        _gameModel.score--;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _gameModel.score = widget.score;
    Future.delayed(const Duration(seconds: 1), () {
      _companyChoice();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ])),
        child: Stack(
          children: [
            // circlular background colors for user selected choice and it will be shown after computer selection
            Positioned(
                left: -70,
                top: 200,
                child: AnimatedOpacity(
                  opacity: compChoice != null ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildContainer(330),
                      _buildContainer(250),
                      _buildContainer(180),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: ListView(
                children: [
                  ScoreBoard(score: _gameModel.score),
                  const SizedBox(height: 70),
                  SizedBox(
                      height: 350,
                      width: 320,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GameButton(
                                key: const ValueKey("user-choice"),
                                borderColor: widget.userChoice.color,
                                shadowColor: widget.userChoice.shadowColor,
                                width: 140,
                                height: 140,
                                child: SvgPicture.asset(
                                  widget.userChoice.assetPath,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                "YOU PICKED",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          // shows computer selection with animation but it shows first dark blue circle until computer select
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(seconds: 2),
                                child: compChoice != null
                                    ? GameButton(
                                        key:
                                            const ValueKey("computer-selected"),
                                        borderColor: compChoice!.color,
                                        shadowColor: compChoice!.shadowColor,
                                        width: 140,
                                        height: 140,
                                        child: SvgPicture.asset(
                                          compChoice!.assetPath,
                                        ),
                                      )
                                    : Container(
                                        key: const ValueKey("computer-selected"),
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                "THE HOUSE PICKED",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      )),
                  AnimatedOpacity(
                    opacity: _status != null ? 1 : 0,
                    duration: const Duration(seconds: 2),
                    child: Column(children: [
                      Text(
                        _status?.text ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 220,
                        height: 50,
                        child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.background)),
                            onPressed: () {
                              Navigator.pop(context, _gameModel.score);
                            },
                            child: Text(
                              "PLAY AGAIN",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  const RulesButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(0.07),
      ),
    );
  }
}
