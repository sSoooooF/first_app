import 'package:first_app/util/extenshionList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// List<Widget> navReturn(int maxPages, int curPage) {
//   const List<Widget> widgetList = [];
//   for (int i = 0; i < maxPages * 2 - 1; i = i + 2) {
//     Color color = i == curPage
//         ? const Color.fromARGB(255, 51, 105, 64)
//         : const Color.fromARGB(255, 211, 232, 210);
//     widgetList[i] = (Container(
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(15),
//       ),
//     ));
//     if (i < maxPages) {
//       widgetList[++i] = (const Spacer());
//     }
//   }
//   return widgetList;
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задачник',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: OnboardingScreen(
        'Задачник',
        'Создай и управляй своими делами в UpTodo',
        'images/icon.svg',
        () {},
        () {},
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final String _imagePath;
  final VoidCallback _onSkipButtonPressed;
  final VoidCallback _onNextButtonPressed;

  const OnboardingScreen(this._title, this._subtitle, this._imagePath,
      this._onSkipButtonPressed, this._onNextButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 116, left: 32, right: 32, bottom: 32),
      child: Column(
        children: [
          Content(
            title: _title,
            subtitle: _subtitle,
            imagePath: _imagePath,
            curPage: 0,
            maxPages: 3,
          ),
          const Spacer(),
          Buttons(
              onSkipButtonPressed: _onSkipButtonPressed,
              onNextButtonPressed: _onNextButtonPressed),
        ],
      ),
    ));
  }
}

class Buttons extends StatelessWidget {
  final VoidCallback onSkipButtonPressed;
  final VoidCallback onNextButtonPressed;

  const Buttons(
      {required this.onSkipButtonPressed, required this.onNextButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: onSkipButtonPressed,
            child: const Text(
              "Пропустить",
            )),
        const Spacer(),
        FilledButton(
          onPressed: onNextButtonPressed,
          child: const Text(
            "Продолжить",
          ),
        )
      ],
    );
  }
}

class Content extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int curPage;
  final int maxPages;

  const Content(
      {required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.curPage,
      required this.maxPages});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
        ),
        const SizedBox(
          height: 32,
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 4,
          width: 100,
          child: Row(
            children: List<Widget>.generate(maxPages, (index) {
              return Expanded(
                flex: 4,
                child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: index == curPage
                          ? colorScheme
                              .primary //material-theme/sys/light/secondary-container
                          : colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    )),
              );
            }).insertBetween(const Spacer(
              flex: 1,
            )),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          textAlign: TextAlign.center,
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
