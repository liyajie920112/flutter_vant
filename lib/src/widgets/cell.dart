import 'package:flutter/material.dart';
import 'package:flutter_vant/src/style/style.dart';

enum CellSize { normal, large }

enum ArrowDirection { left, right, up, down }

class Cell extends StatelessWidget {
  final String? title;
  final String? value;
  final String? label;
  final CellSize size;
  final IconData? icon;
  final bool border;

  /// click feedback
  final bool clickable;

  /// show right arrow and click feedback
  final bool isLink;

  /// show required *
  final bool required;

  /// is content vertical center
  final bool center;

  /// arrow direction
  final ArrowDirection arrowDirection;

  const Cell(
      {Key? key,
      this.title,
      this.value,
      this.label,
      this.size: CellSize.normal,
      this.icon,
      this.border: true,
      this.clickable: false,
      this.isLink: false,
      this.required: false,
      this.center: false,
      this.arrowDirection: ArrowDirection.right})
      : super(key: key);

  get _title {
    if (title != null) {
      return title;
    }
    return '';
  }

  get _value {
    if (value != null) {
      return value;
    }
    return '';
  }

  List<Widget> topWidget() {
    List<Widget> list = [];
    if (_title != '') {
      list.add(Text(_title,
          style: TextStyle(
              fontSize: Style.cellNormalFontSize,
              color: Style.cellTitleColor)));
    }
    if (_value != '') {
      list.add(Text(_value,
          style: TextStyle(
              fontSize: Style.cellNormalFontSize,
              color: Style.cellValueColor)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: topWidget(),
            ),
          )
        ],
      ),
    );
  }
}
