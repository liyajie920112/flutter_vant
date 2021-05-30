import 'package:flutter/material.dart';
import 'package:flutter_vant/src/style/style.dart';

// 按钮类型枚举
enum buttonType { primary, info, default_, warning, danger }
// 按钮大小枚举
enum buttonSize { large, normal, small, mini }

class Button extends StatelessWidget {
  final String? text; // 文案
  final buttonType type; // 按钮类型
  final bool plain; // 是否为朴素按钮
  final buttonSize size;
  final bool hairline; // 是否是细边框
  final bool square; // 是否是方形按钮
  final bool round; // 是否是圆形按钮
  final IconData? icon; // 按钮组件
  final bool block; // 是否是块级元素
  final dynamic color; // 自定义颜色
  Button(
      {Key? key,
      this.type: buttonType.default_,
      this.plain: false,
      this.size: buttonSize.normal,
      this.hairline: false,
      this.square: false,
      this.round: false,
      this.icon,
      this.block: false,
      this.color,
      this.text})
      : super(key: key);

  Map<buttonType, dynamic> colors = {
    buttonType.default_: {
      'bgColor': Style.buttonDefaultBgColor,
      'bdColor': Style.buttonDefaultBdColor,
      'color': Style.buttonDefaultColor
    },
    buttonType.primary: {
      'bgColor': Style.buttonPrimaryBgColor,
      'bdColor': Style.buttonPrimaryBdColor,
      'color': Style.buttonPrimaryColor
    },
    buttonType.info: {
      'bgColor': Style.buttonInfoBgColor,
      'bdColor': Style.buttonInfoBdColor,
      'color': Style.buttonInfoColor
    },
    buttonType.danger: {
      'bgColor': Style.buttonDangerBgColor,
      'bdColor': Style.buttonDangerBdColor,
      'color': Style.buttonDangerColor
    },
    buttonType.warning: {
      'bgColor': Style.buttonWarningBgColor,
      'bdColor': Style.buttonWarningBdColor,
      'color': Style.buttonWarningColor
    },
  };

  Map<buttonSize, double> sizes = {
    buttonSize.large: Style.buttonLargeHeight,
    buttonSize.normal: Style.buttonNormalHeight,
    buttonSize.small: Style.buttonSmallHeight,
    buttonSize.mini: Style.buttonMiniHeight,
  };

  Map<buttonSize, double> fontSizes = {
    buttonSize.large: Style.buttonLargeFontSize,
    buttonSize.normal: Style.buttonNormalFontSize,
    buttonSize.small: Style.buttonSmallFontSize,
    buttonSize.mini: Style.buttonMiniFontSize,
  };

  Map<buttonSize, double> paddings = {
    buttonSize.large: Style.buttonLargePadding,
    buttonSize.normal: Style.buttonNormalPadding,
    buttonSize.small: Style.buttonSmallPadding,
    buttonSize.mini: Style.buttonMiniPadding,
  };

  @override
  Widget build(BuildContext context) {
    // 圆角度数
    double borderRoundRadius = sizes[size]! / 2;
    // icon字体大小
    double iconFontSize = fontSizes[size]! + 6;

    // 背景色
    Color bgColor = plain
        ? Style.buttonPlainBgColor
        : color != null
            ? color
            : colors[this.type]['bgColor'];
    // 前景色
    Color fColor = plain
        ? color != null
            ? color
            : colors[this.type]['bgColor']
        : colors[this.type]['color'];
    // 边框颜色
    Color bdColor = color != null ? color : colors[this.type]['bdColor'];
    return Container(
      height: sizes[this.size],
      padding: EdgeInsets.only(left: paddings[size]!, right: paddings[size]!),
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
              color: bdColor,
              width: hairline
                  ? Style.buttonHairlineBorderWidth
                  : Style.buttonBorderWidth),
          borderRadius: BorderRadius.circular(this.square
              ? Style.buttonSquareBorderRadius
              : this.round
                  ? borderRoundRadius
                  : Style.buttonBorderRadius)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
          children: [
            icon != null
                ? Container(
                    margin: EdgeInsets.only(right: this.text == null ? 0 : 4),
                    child: Icon(
                      icon,
                      size: iconFontSize,
                      color: fColor,
                    ),
                  )
                : Container(),
            Text(
              this.text == null ? '' : this.text!,
              textAlign: TextAlign.center,
              style: TextStyle(color: fColor, fontSize: fontSizes[buttonSize]),
            )
          ]),
    );
  }
}
