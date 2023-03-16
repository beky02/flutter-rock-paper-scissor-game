import 'package:flutter/material.dart';


/// A circular area that will show choice icon in the game and will responds when it is tapped.

class GameButton extends StatelessWidget {
  const GameButton(
      {Key? key,
      required this.child,
      required this.borderColor,
      required this.shadowColor,
      this.onTap,
      this.height,
      this.width})
      : super(key: key);

  /// The [child] contained by the GameButton.
  final Widget child;


  /// Called when the user taps it. (i.e., when a user choosing Paper or rock).
  final Function? onTap;

  /// The color to paint border of [child].
  final Color borderColor;

  /// The color to shadow border of [child].
  final Color shadowColor;

  final double? height;

  final double? width;

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null
          ? null
          : () {
              onTap!();
            },
      child: Container(
        height: height ?? 100,
        width: width ?? 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: borderColor,
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  spreadRadius: 1,
                  offset: const Offset(0, 3)),
              BoxShadow(
                color: borderColor,
                spreadRadius: 1,
                offset: const Offset(0, -3),
              ),
            ]),
        child: Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all( height != null ? 30 : 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                    color: Colors.white60,
                    spreadRadius: 1,
                    offset: Offset(0, -3))
              ]),
          child: child,
        ),
      ),
    );
  }
}
