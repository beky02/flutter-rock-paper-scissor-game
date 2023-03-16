import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissor_game/enums/choice.dart';
import 'package:rock_paper_scissor_game/enums/game_result_status.dart';
import 'package:rock_paper_scissor_game/model/game_model.dart';

void main() {
  test('game winner logic test', () async {
    GameResultStatus gameResultWinStatus = GameModel()
        .checkGameWinner(userChoice: Choice.paper, compChoice: Choice.rock);
    GameResultStatus gameResultLoseStatus = GameModel()
        .checkGameWinner(userChoice: Choice.paper, compChoice: Choice.scissors);

    GameResultStatus gameResultDrawStatus = GameModel()
        .checkGameWinner(userChoice: Choice.rock, compChoice: Choice.rock);

    // Verify that the result is WIN.
    expect(gameResultWinStatus, GameResultStatus.win);

    // Verify that the result is LOSE.
    expect(gameResultLoseStatus, GameResultStatus.lose);

    // Verify that the result is DRAW.
    expect(gameResultDrawStatus, GameResultStatus.draw);
  });
}
