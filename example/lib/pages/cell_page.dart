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
              value: '内容内容内容内容内容内容内容内容',
              clickable: true,
              onClick: () {
                print('dianji');
              },
            ),
            Cell(
              value: '内容',
              clickable: true,
              onClick: () {
                print('dianji2');
              },
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
              title: '单元格 center',
              label: '描述信息',
              center: true,
              value: '内容',
            ),
            Cell(
              title: '单元格 icon',
              icon: Icons.location_on_outlined,
              value: '内容',
            ),
            Cell(
              title: '单元格link',
              value: '内容内容内容内容内容内容',
              isLink: true,
            ),
            Cell(
              title: '单元格下箭头',
              value: '内容',
              arrowDirection: ArrowDirection.down,
              isLink: true,
            ),
            Cell(
              title: '单元格 border: false',
              value: '内容',
              isLink: true,
              border: false,
            ),
            Cell(
              title: '单元格 slotTitle',
              value: '内容',
              isLink: true,
              slotTitle: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  '标签',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Cell(
              title: '单元格 slot right icon',
              slotRightIcon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}
