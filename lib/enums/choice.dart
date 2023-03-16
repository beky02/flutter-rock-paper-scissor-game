import 'package:flutter/material.dart';

/// The choice type which the user and the computer will choose.

enum Choice { rock, paper, scissors, spock, lizard }


/// return the icon path of the choice
extension ChoiceExtension on Choice {
  String get assetPath {
    switch (this) {
      case Choice.rock:
        return 'assets/icons/icon-rock.svg';
      case Choice.paper:
        return 'assets/icons/icon-paper.svg';
      case Choice.scissors:
        return 'assets/icons/icon-scissors.svg';
      case Choice.spock:
        return 'assets/icons/icon-spock.svg';
      case Choice.lizard:
        return 'assets/icons/icon-lizard.svg';
      default:
        return 'Unknown';
    }
  }


  /// return color of the choice
  Color get color {
    switch (this) {
      case Choice.rock:
        return const HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor();
      case Choice.paper:
        return const HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor();
      case Choice.scissors:
        return const HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor();
      case Choice.spock:
        return const HSLColor.fromAHSL(1, 189, 0.59, 0.53).toColor();
      case Choice.lizard:
        return const HSLColor.fromAHSL(1, 261, 0.73, 0.60).toColor();
      default:
        return Colors.white;
    }
  }

  /// return shadow color of the choice
  Color get shadowColor {
    switch (this) {
      case Choice.rock:
        return const HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor();
      case Choice.paper:
        return const HSLColor.fromAHSL(1, 230, 0.64, 0.46).toColor();
      case Choice.scissors:
        return const HSLColor.fromAHSL(1, 40, 0.64, 0.46).toColor();
      case Choice.spock:
        return const HSLColor.fromAHSL(1, 189, 0.64, 0.46).toColor();
      case Choice.lizard:
        return const HSLColor.fromAHSL(1, 261, 0.64, 0.46).toColor();
      default:
        return Colors.white;
    }
  }
}
