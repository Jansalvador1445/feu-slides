import 'package:flutter/material.dart';
import 'package:flutter_presentation_feu/shared/stacked-pages.dart';
import 'package:presentation/presentation.dart';

class AgendaContentPage extends StatelessWidget {
  const AgendaContentPage(
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
          Text('Introduction to Flutter'),
          Text('Get Started with Flutter'),
          Text('Prototyping'),
        ],
      ),
    );
  }
}
