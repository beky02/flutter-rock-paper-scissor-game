import 'package:rock_paper_scissor_game/enums/choice.dart';
import 'package:rock_paper_scissor_game/enums/game_result_status.dart';

class GameModel {
  int score;
  List<Choice> choices;

  GameModel()
      : score = 0,
        choices = [Choice.rock, Choice.paper, Choice.scissors, Choice.lizard, Choice.spock];

// Takes the values [userChoice] and [computerChoice] and returns the game result status.
  GameResultStatus checkGameWinner(
      {required Choice userChoice, required Choice compChoice}) {
    if (GameRules().gameRules[userChoice]![compChoice] ==
        GameResultStatus.win) {
      return GameResultStatus.win;
    } else if (GameRules().gameRules[userChoice]![compChoice] ==
        GameResultStatus.lose) {
      return GameResultStatus.lose;
    }
    return GameResultStatus.draw;
  }
}

class GameRules {
  Map<Choice, Map<Choice, GameResultStatus>> gameRules = {
    Choice.rock: {
      Choice.rock: GameResultStatus.draw,
      Choice.paper: GameResultStatus.lose,
      Choice.scissors: GameResultStatus.win,
      Choice.lizard: GameResultStatus.win,
      Choice.spock: GameResultStatus.lose,
    },
    Choice.paper: {
      Choice.rock: GameResultStatus.win,
      Choice.paper: GameResultStatus.draw,
      Choice.scissors: GameResultStatus.lose,
      Choice.spock: GameResultStatus.win,
      Choice.lizard: GameResultStatus.lose,
    },
    Choice.scissors: {
      Choice.rock: GameResultStatus.lose,
      Choice.paper: GameResultStatus.win,
      Choice.scissors: GameResultStatus.draw,
      Choice.lizard: GameResultStatus.win,
      Choice.spock: GameResultStatus.lose,
    },
    Choice.lizard: {
      Choice.rock: GameResultStatus.lose,
      Choice.paper: GameResultStatus.win,
      Choice.scissors: GameResultStatus.lose,
      Choice.lizard: GameResultStatus.draw,
      Choice.spock: GameResultStatus.win,
    },
    Choice.spock: {
      Choice.rock: GameResultStatus.win,
      Choice.paper: GameResultStatus.lose,
      Choice.scissors: GameResultStatus.win,
      Choice.lizard: GameResultStatus.lose,
      Choice.spock: GameResultStatus.draw,
    }
  };
}
