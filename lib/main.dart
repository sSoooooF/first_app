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
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 116, left: 32, right: 32, bottom: 32),
      child: Column(
        children: [
          Content(
            'Управляй своими задачами',
            'Вы можете легко управлять всеми своими задачами в UpTodo',
            'icon.svg',
          ),
          Spacer(),
          Buttons(),
        ],
      ),
    ));
  }
}

class Buttons extends StatelessWidget {
  const Buttons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TextButton(
            onPressed: null,
            child: Text(
              "Пропустить",
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )),
        Spacer(),
        FilledButton(
          style: ButtonStyle(),
          onPressed: null,
          child: Text(
            "Продолжить",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
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

  const Content(this.title, this.subtitle, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset('icon.svg'),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 4,
            width: 100,
            child: Row(
              children: List.generate(3, (index) {
                return Container(
                    width: 25,
                    height: 4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ));
              }),
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
      ),
    );
  }
}
