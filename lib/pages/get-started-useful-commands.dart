import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentation_feu/shared/group-theme.dart';
import 'package:flutter_presentation_feu/shared/revolving-widget.dart';
import 'package:presentation/presentation.dart';

class UsefulCommandsIsFunction extends StatefulWidget {
  const UsefulCommandsIsFunction(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _UsefulCommandsIsFunctionState createState() =>
      _UsefulCommandsIsFunctionState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _UsefulCommandsIsFunctionState extends State<UsefulCommandsIsFunction>
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
                const TextSpan(text: "Useful Commands\n"),
                const TextSpan(text: "\nFlutter Doctor : "),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text(''),
                      secondChild: const Text(
                        'flutter doctor -v',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: "\nFlutter Create : "),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text(''),
                      secondChild: const Text(
                        'flutter create insert_project_name',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: "\nFlutter Run : "),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text(''),
                      secondChild: const Text(
                        'flutter run -d "specific_name_device"',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: "\nFlutter Packages Get : "),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text(''),
                      secondChild: const Text(
                        'flutter packages get',
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
