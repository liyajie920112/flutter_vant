import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';
import 'package:flutter_vant/src/style/style.dart';

class CellGroup extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const CellGroup({Key? key, this.title, required this.children})
      : super(key: key);

  List<Widget> get _children {
    List<Widget> list = [];
    if (children.length > 0) {
      var last = children.last as Cell;
      last.border = false;
      list.add(DecoratedBox(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: Style.cellBorderHeight,
                    color: Style.cellBorderColor),
                bottom: BorderSide(
                    width: Style.cellBorderHeight,
                    color: Style.cellBorderColor))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ));
    }
    if (title != null) {
      list.insert(
          0,
          Container(
            padding: Style.cellGroupTitlePadding,
            child: Text(
              title!,
              style: TextStyle(
                  fontSize: Style.cellGroupTitleFontSize,
                  color: Style.cellGroupTitleColor),
            ),
          ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _children,
    );
  }
}
