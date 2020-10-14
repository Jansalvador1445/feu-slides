import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentation_feu/shared/group-theme.dart';
import 'package:flutter_presentation_feu/shared/revolving-widget.dart';
import 'package:presentation/presentation.dart';

class IntroFlutterWidgetIsFunction extends StatefulWidget {
  const IntroFlutterWidgetIsFunction(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _IntroFlutterWidgetIsFunctionState createState() =>
      _IntroFlutterWidgetIsFunctionState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _IntroFlutterWidgetIsFunctionState
    extends State<IntroFlutterWidgetIsFunction>
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
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('Flutter'),
                      secondChild: const Text(
                        'Flutter',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(
                    text: " is UI toolkit that allows you to build "),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('beautifully designed '),
                      secondChild: const Text(
                        'beautifully designed ',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: ' and '),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('high performing '),
                      secondChild: const Text(
                        'high performing ',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: 'apps with '),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild:
                          const Text('improved developer productivity.'),
                      secondChild: const Text(
                        'improved developer productivity.',
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
