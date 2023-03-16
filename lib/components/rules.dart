import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget for the rules preview layout

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "RULES",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset('assets/icons/image-rules-bonus.svg'),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.35),
                  size: 40,
                ))
          ]),
    );
  }
}
