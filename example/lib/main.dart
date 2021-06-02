import 'package:example/pages/button_page.dart';
import 'package:example/pages/cell_group_page.dart';
import 'package:example/pages/cell_page.dart';
import 'package:example/pages/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Vant'),
      routes: {
        '/button': (context) => ButtonPage(),
        '/cell': (context) => CellPage(),
        '/cell_group': (context) => CellGroupPage(),
        '/image': (context) => ImagePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CellGroup(title: '基础组件', children: [
                Cell(
                  title: '按钮',
                  isLink: true,
                  onClick: () => {Navigator.pushNamed(context, '/button')},
                ),
                Cell(
                  title: 'Cell',
                  isLink: true,
                  onClick: () => {Navigator.pushNamed(context, '/cell')},
                ),
                Cell(
                  title: 'CellGroup',
                  isLink: true,
                  onClick: () => {Navigator.pushNamed(context, '/cell_group')},
                ),
                Cell(
                  title: 'Image',
                  isLink: true,
                  onClick: () => {Navigator.pushNamed(context, '/image')},
                ),
              ]),
            ],
          ),
        ));
  }
}

class _Cell extends StatelessWidget {
  final String title;
  final Function? onClick;
  const _Cell({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.onClick == null) {
          return;
        }
        this.onClick!();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
