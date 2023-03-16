import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that shows the logo and score value

class ScoreBoard extends StatefulWidget {
  final int score;
  const ScoreBoard({Key? key, required this.score}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width > 430 ? 430 : double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 3)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/logo-bonus.svg',
            height: 60,
          ),
        ),
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SCORE", style: Theme.of(context).textTheme.bodySmall),
              Text(
                widget.score.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
