import 'package:flutter/material.dart';
import 'package:flutter_presentation_feu/shared/stacked-pages.dart';
import 'package:presentation/presentation.dart';

class ChallengesContentPage extends StatelessWidget {
  const ChallengesContentPage(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: StackedPage(
        controller: controller,
        children: const [
          Text('📱 Android & iOS'),
          Text('📱 Screen Density'),
          Text('💻 Resources'),
          Text('💵 Budgets'),
        ],
      ),
    );
  }
}
