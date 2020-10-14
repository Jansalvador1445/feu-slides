import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentation_feu/shared/group-theme.dart';
import 'package:flutter_presentation_feu/shared/revolving-widget.dart';
import 'package:presentation/presentation.dart';

class DevelopmentToolsIsFunction extends StatefulWidget {
  const DevelopmentToolsIsFunction(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _DevelopmentToolsIsFunctionState createState() =>
      _DevelopmentToolsIsFunctionState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _DevelopmentToolsIsFunctionState extends State<DevelopmentToolsIsFunction>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  RevolvingState _revolvingState = RevolvingState.showFirst;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.flutter,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.flutter,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodyText2,
          child: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: "Development Tools\n"),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('VS Code'),
                      secondChild: const Text(
                        'VS Code',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: "\n"),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('Android Studio'),
                      secondChild: const Text(
                        'Android Studio',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: "\n"),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('XCode'),
                      secondChild: const Text(
                        'XCode',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
