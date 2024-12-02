import 'package:flutter/material.dart';

class SourceTabWidget extends StatelessWidget {
  String source;

  SourceTabWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 34,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        textAlign: TextAlign.center,
        source,
      ),
    );
  }
}
