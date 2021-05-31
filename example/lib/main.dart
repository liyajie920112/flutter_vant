import 'package:example/pages/button_page.dart';
import 'package:example/pages/cell_page.dart';
import 'package:flutter/material.dart';

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
        '/cell': (context) => CellPage()
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '基础组件',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              _Cell(
                title: '按钮',
                onClick: () => {Navigator.pushNamed(context, '/button')},
              ),
              _Cell(
                title: 'Cell单元格',
                onClick: () => {Navigator.pushNamed(context, '/cell')},
              )
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
