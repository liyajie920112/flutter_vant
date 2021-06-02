import 'package:flutter/material.dart';
import 'package:flutter_vant/src/style/style.dart';

enum CellSize { normal, large }

enum ArrowDirection { left, right, up, down }

enum CellPropType {
  fontSize,
  minHeight,
  cellHPadding,
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

  final Widget? slotTitle;

  final IconData? slotRightIcon;

  final Function? onClick;
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
      this.slotTitle,
      this.slotRightIcon,
      this.onClick,
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
        return Icons.expand_less;
      case ArrowDirection.down:
        return Icons.expand_more;
    }
  }

  Map<CellSize, dynamic> cellProps = {
    CellSize.normal: <CellPropType, dynamic>{
      CellPropType.fontSize: Style.cellNormalFontSize,
      CellPropType.cellHPadding: Style.cellNormalHPadding,
      CellPropType.minHeight: Style.cellNormalMinHeight,
      CellPropType.cellVPadding: Style.cellNormalVPadding
    },
    CellSize.large: <CellPropType, dynamic>{
      CellPropType.fontSize: Style.cellLargeFontSize,
      CellPropType.cellHPadding: Style.cellLargeHPadding,
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
        slotRightIcon != null ? slotRightIcon : _arrowIcon,
        size: Style.cellRightIconFontSize,
        color: Style.cellValueColor,
      ),
    );
  }

  List<Widget> titleRow() {
    List<Widget> list = [];
    list.add(Text(
      _title,
      style: TextStyle(
          height: cellProps[size][CellPropType.minHeight] /
              cellProps[size][CellPropType.fontSize],
          leadingDistribution: TextLeadingDistribution.even,
          fontSize: cellProps[size][CellPropType.fontSize],
          color: Style.cellTitleColor),
    ));
    if (slotTitle != null) {
      list.add(Container(margin: EdgeInsets.only(left: 4), child: slotTitle!));
    }
    return list;
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
            child: Row(
              children: titleRow(),
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
                      height: cellProps[size][CellPropType.minHeight] /
                          cellProps[size][CellPropType.fontSize],
                      leadingDistribution: TextLeadingDistribution.even,
                      fontSize: cellProps[size][CellPropType.fontSize],
                      color: list.length == 0
                          ? Style.cellTitleColor
                          : Style.cellValueColor),
                ))),
      ));
    }
    if (isLink || slotRightIcon != null) {
      list.add(getRightIcon());
    }
    return list;
  }

  Border? get _border {
    if (!border) {
      return null;
    }
    return Border(
        bottom: BorderSide(
            width: Style.cellBorderHeight, color: Style.cellBorderColor));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          if (onClick == null) {
            return;
          }
          onClick!();
        },
        focusColor: !clickable && !isLink
            ? Style.transparent
            : Theme.of(context).focusColor,
        highlightColor: !clickable && !isLink
            ? Style.transparent
            : Theme.of(context).highlightColor,
        hoverColor: !clickable && !isLink
            ? Style.transparent
            : Theme.of(context).hoverColor,
        splashColor: !clickable && !isLink
            ? Style.transparent
            : Theme.of(context).splashColor,
        child: Container(
            padding: cellProps[size][CellPropType.cellHPadding],
            child: Container(
              padding: cellProps[size][CellPropType.cellVPadding],
              decoration: BoxDecoration(border: _border),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: center
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: topWidget(),
              ),
            )),
      ),
    );
  }
}
