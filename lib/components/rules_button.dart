import 'package:flutter/material.dart';
import 'package:rock_paper_scissor_game/components/rules.dart';

/// An outlined button that will call rules ModalBottomSheet

class RulesButton extends StatelessWidget {
  const RulesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 170,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            _ruleModalBottomSheet(context);
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(
                width: 2.0, color: Theme.of(context).colorScheme.tertiary),
          ),
          child: Text(
            "RULES",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  void _ruleModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.background,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return const Rules();
        });
  }
}
