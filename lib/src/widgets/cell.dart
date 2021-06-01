import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vant/src/style/style.dart';

enum CellSize { normal, large }

enum ArrowDirection { left, right, up, down }

enum CellPropType {
  fontSize,
  minHeight,
  cellPadding,
  cellVPadding,
  leftIcon,
  rightIcon
}

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

  Cell(
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

  IconData get _arrowIcon {
    switch (arrowDirection) {
      case ArrowDirection.right:
        return Icons.chevron_right;
      case ArrowDirection.left:
        return Icons.chevron_left;
      case ArrowDirection.up:
        return Icons.expand_more;
      case ArrowDirection.down:
        return Icons.expand_less;
    }
  }

  Map<CellSize, dynamic> cellProps = {
    CellSize.normal: <CellPropType, dynamic>{
      CellPropType.fontSize: Style.cellNormalFontSize,
      CellPropType.cellPadding: Style.cellNormalPadding,
      CellPropType.minHeight: Style.cellNormalMinHeight,
      CellPropType.cellVPadding: Style.cellNormalVPadding
    },
    CellSize.large: <CellPropType, dynamic>{
      CellPropType.fontSize: Style.cellLargeFontSize,
      CellPropType.cellPadding: Style.cellLargePadding,
      CellPropType.minHeight: Style.cellLargeMinHeight,
      CellPropType.cellVPadding: Style.cellLargeVPadding
    },
  };

  Widget getLeftIcon() {
    return Container(
      height: cellProps[size][CellPropType.minHeight],
      width: Style.cellIconWidth,
      margin: EdgeInsets.only(right: 4),
      child: Icon(
        icon,
        size: cellProps[size][CellPropType.fontSize],
        color: Style.cellTitleColor,
      ),
    );
  }

  Widget getRightIcon() {
    return Container(
      height: cellProps[size][CellPropType.minHeight],
      width: Style.cellIconWidth,
      margin: EdgeInsets.only(left: 4),
      child: Icon(
        _arrowIcon,
        size: Style.cellRightIconFontSize,
        color: Style.cellValueColor,
      ),
    );
  }

  List<Widget> topWidget() {
    List<Widget> list = [];
    if (icon != null) {
      list.add(getLeftIcon());
    }
    if (_title != '') {
      List<Widget> col = [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _title,
              style: TextStyle(
                  height: cellProps[size][CellPropType.minHeight] /
                      cellProps[size][CellPropType.fontSize],
                  leadingDistribution: TextLeadingDistribution.even,
                  fontSize: cellProps[size][CellPropType.fontSize],
                  color: Style.cellTitleColor),
            ),
          ),
        )
      ];
      if (label != null) {
        col.add(
          Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                label!,
                style: TextStyle(
                    color: Style.cellLabelColor,
                    fontSize: Style.cellLabelFontSize),
              )),
        );
      }
      list.add(Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: col,
          )));
    }
    if (_value != '') {
      list.add(Expanded(
        flex: 1,
        child: Container(
            child: Align(
                alignment: list.length == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(
                  _value,
                  style: TextStyle(
                      fontSize: cellProps[size][CellPropType.fontSize],
                      color: list.length == 0
                          ? Style.cellTitleColor
                          : Style.cellValueColor),
                ))),
      ));
    }
    if (isLink) {
      list.add(getRightIcon());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return Container(
        padding: cellProps[size][CellPropType.cellPadding],
        child: Container(
          padding: cellProps[size][CellPropType.cellVPadding],
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: Style.cellBorderHeight,
                      color: Style.cellBorderColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: topWidget(),
          ),
        ));
  }
}
