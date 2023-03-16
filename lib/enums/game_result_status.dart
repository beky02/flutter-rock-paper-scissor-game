
/// A game result status

enum GameResultStatus { win, lose, draw }

extension GameResultStatusExtension on GameResultStatus {
  String get text {
    switch (this) {
      case GameResultStatus.win:
        return 'YOU WIN';
      case GameResultStatus.lose:
        return 'YOU LOSE';
      case GameResultStatus.draw:
        return 'YOU DRAW';
      default:
        return 'Unknown';
    }
  }
}
