import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rock_paper_scissor_game/components/game_button.dart';
import 'package:rock_paper_scissor_game/enums/choice.dart';

/// A Game play area that shows multiple game choice icon in the game screen.
///
/// will call its callback when user taps one of the choice.

class GamePad extends StatefulWidget {
  const GamePad({Key? key, required this.onUserSelect}) : super(key: key);

  /// Called when the user taps from a triangular choice([GameButton]). (i.e., when a user taps Paper).
  ///
  ///
  final Function(Choice choice) onUserSelect;

  @override
  _GamePadState createState() => _GamePadState();
}

class _GamePadState extends State<GamePad> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 360,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/bg-pentagon.svg',
            width: 200,
            height: 240,
          ),
          Positioned(
              top: 0,
              left: 115,
              child: GameButton(
                  borderColor: Choice.scissors.color,
                  shadowColor: Choice.scissors.shadowColor,
                  onTap: () {
                    widget.onUserSelect.call(Choice.scissors);
                  },
                  child: SvgPicture.asset(
                    Choice.scissors.assetPath,
                  ))),
          Positioned(
              top: 100,
              left: 0,
              child: GameButton(
                  borderColor: Choice.spock.color,
                  shadowColor: Choice.spock.shadowColor,
                  onTap: () {
                    widget.onUserSelect.call(Choice.spock);
                  },
                  child: SvgPicture.asset(
                    Choice.spock.assetPath,
                  ))),
          Positioned(
              top: 100,
              right: 0,
              child: GameButton(
                  borderColor: Choice.paper.color,
                  shadowColor: Choice.paper.shadowColor,
                  onTap: () {
                    widget.onUserSelect.call(Choice.paper);
                  },
                  child: SvgPicture.asset(
                    Choice.paper.assetPath,
                  ))),
          Positioned(
              bottom: 15,
              right: 30,
              child: GameButton(
                  borderColor: Choice.rock.color,
                  shadowColor: Choice.rock.shadowColor,
                  onTap: () {
                    widget.onUserSelect.call(Choice.rock);
                  },
                  child: SvgPicture.asset(
                    Choice.rock.assetPath,
                  ))),
          Positioned(
              bottom: 15,
              left: 30,
              child: GameButton(
                  borderColor: Choice.lizard.color,
                  shadowColor: Choice.lizard.shadowColor,
                  onTap: () {
                    widget.onUserSelect.call(Choice.lizard);
                  },
                  child: SvgPicture.asset(
                    Choice.lizard.assetPath,
                  ))),
          // SizedBox(
          //   height: 410,
          //   width: 375,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           GameButton(
          //               child: SvgPicture.asset(
          //                 Choice.paper.assetPath,
          //               ),
          //               borderColor: Choice.paper.color,
          //               shadowColor: Choice.paper.shadowColor,
          //               onTap: () {
          //                 widget.onUserSelect.call(Choice.paper);
          //               }),
          //           GameButton(
          //               child: SvgPicture.asset(
          //                 Choice.scissors.assetPath,
          //               ),
          //               borderColor: Choice.scissors.color,
          //               shadowColor: Choice.scissors.shadowColor,
          //               onTap: () {
          //                 widget.onUserSelect.call(Choice.scissors);
          //               }),
          //         ],
          //       ),
          //       GameButton(
          //           child: SvgPicture.asset(
          //             Choice.rock.assetPath,
          //           ),
          //           borderColor: Choice.rock.color,
          //           shadowColor: Choice.rock.shadowColor,
          //           onTap: () {
          //             widget.onUserSelect.call(Choice.rock);
          //           }),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
