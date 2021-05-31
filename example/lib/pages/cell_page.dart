import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';

class CellPage extends StatelessWidget {
  const CellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vant Cell'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Cell(
              title: '单元格',
              value: '内容',
            ),
            Cell(
              value: '内容',
            ),
          ],
        ),
      ),
    );
  }
}
