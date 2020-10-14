import 'package:flutter/material.dart';
import 'package:flutter_presentation_feu/pages/agenda-content-page.dart';
import 'package:flutter_presentation_feu/pages/agenda-page.dart';
import 'package:flutter_presentation_feu/pages/challenges-content-page.dart';
import 'package:flutter_presentation_feu/pages/get-started-development-tools.dart';
import 'package:flutter_presentation_feu/pages/get-started-everything-is-a-widget.dart';
import 'package:flutter_presentation_feu/pages/get-started-installation-sdk.dart';
import 'package:flutter_presentation_feu/pages/get-started-useful-commands.dart';
import 'package:flutter_presentation_feu/pages/intro-flutter-function-page-second.dart';
import 'package:flutter_presentation_feu/pages/introduction-page.dart';
import 'package:flutter_presentation_feu/pages/questions-page.dart';
import 'package:flutter_presentation_feu/pages/section-page.dart';
import 'package:flutter_presentation_feu/shared/logo-name.dart';
import 'package:flutter_presentation_feu/shared/shared-theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';
import 'challenges-page.dart';
import 'intro-flutter-function-page-second copy.dart';
import 'intro-flutter-function-page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController controller;
  PresentationController presentationController;

  // Init State
  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(
      controller: controller,
      animationDuration: const Duration(milliseconds: 600),
    );
  }

  // Dispose
  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: blueDark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (_) {
          final children = [
            const IntroductionPage(),
            const SectionPage('About Me'),
            const ChallengesPage(),
            ChallengesContentPage(presentationController),
            const AgendaPage(),
            AgendaContentPage(presentationController),
            ...[
              const SectionPage('Introduction to Flutter'),
              IntroFlutterWidgetIsFunction(presentationController),
              IntroFlutterWidgetIsFunctionSecond(presentationController),
              IntroFlutterWidgetIsFunctionThird(presentationController),
            ],
            ...[
              const SectionPage('Get Started'),
              GetStartedEveryThingIsAWidgetIsFunction(presentationController),
              InstallationSDKIsFunction(presentationController),
              UsefulCommandsIsFunction(presentationController),
              DevelopmentToolsIsFunction(presentationController),
            ],
            const SectionPage('Prototyping'),
            const QuestionPage()
          ];

          return Stack(
            fit: StackFit.expand,
            children: [
              Presentation(
                controller: controller,
                presentationController: presentationController,
                children: children,
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) {
                    final page = controller.page ?? 0.0;
                    return Logo(
                      visible: (page * 1000).floor() % 1000 == 0,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/flutter-ph-logo-edited.png',
                            height: 110,
                          ),
                          Text(
                            'Jan Salvador Sebastian',
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                    color: (page.round() == children.length - 1
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(0.6),
                                  ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
