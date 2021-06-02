import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';

class CellGroupPage extends StatelessWidget {
  const CellGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vant Cell Group'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CellGroup(title: '分组标题', children: [
              Cell(
                title: '单元格',
              ),
              Cell(
                title: '单元格2',
              ),
            ]),
            CellGroup(title: '分组2', children: [
              Cell(
                title: '单元格',
              ),
              Cell(
                title: '单元格2',
              ),
            ]),
            CellGroup(title: '分组3', children: [
              Cell(
                title: '单元格',
              ),
              Cell(
                title: '单元格2',
              ),
            ])
          ],
        )));
  }
}
