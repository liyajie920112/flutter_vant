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
            Cell(
              title: '单元格大小',
              size: CellSize.large,
              value: '内容',
            ),
            Cell(
              title: '单元格',
              label: '描述信息',
              value: '内容',
            ),
            Cell(
              title: '单元格',
              label: '描述信息',
              center: true,
              value: '内容',
            ),
            Cell(
              title: '单元格单元格单元格单元格单元格',
              icon: Icons.location_on_outlined,
              value: '内容',
            ),
            Cell(
              title: '单元格',
              value: '内容',
              isLink: true,
            ),
          ],
        ),
      ),
    );
  }
}
