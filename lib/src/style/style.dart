import 'package:flutter/material.dart';

class Convert {
  static Color toColor(String color) {
    String _color = '0xff${color.substring(1)}';
    return Color(int.parse(_color));
  }
}

class Style {
  // 朴素按钮背景色
  static Color buttonPlainBgColor = Convert.toColor('#ffffff');

  // 边框高度
  static double buttonBorderWidth = 1;
  static double buttonHairlineBorderWidth = 0.5;

  // 边框圆角
  static double buttonBorderRadius = 2;
  static double buttonSquareBorderRadius = 0;

  // 按钮背景颜色
  static Color buttonDefaultBgColor = Convert.toColor('#ffffff');
  static Color buttonPrimaryBgColor = Convert.toColor('#07c160');
  static Color buttonDangerBgColor = Convert.toColor('#ee0a24');
  static Color buttonInfoBgColor = Convert.toColor('#1989fa');
  static Color buttonWarningBgColor = Convert.toColor('#ff976a');

  // 按钮边框颜色
  static Color buttonDefaultBdColor = Convert.toColor('#ebedf0');
  static Color buttonPrimaryBdColor = buttonPrimaryBgColor;
  static Color buttonDangerBdColor = buttonDangerBgColor;
  static Color buttonInfoBdColor = buttonInfoBgColor;
  static Color buttonWarningBdColor = buttonWarningBgColor;

  // 按钮边框颜色
  static Color buttonDefaultColor = Convert.toColor('#323233');
  static Color buttonPrimaryColor = Convert.toColor('#ffffff');
  static Color buttonDangerColor = Convert.toColor('#ffffff');
  static Color buttonInfoColor = Convert.toColor('#ffffff');
  static Color buttonWarningColor = Convert.toColor('#ffffff');

  // 按钮大小
  static double buttonLargeHeight = 48;
  static double buttonNormalHeight = 42;
  static double buttonSmallHeight = 30;
  static double buttonMiniHeight = 22;

  // 按钮字体大小
  static double buttonLargeFontSize = 16;
  static double buttonNormalFontSize = 14;
  static double buttonSmallFontSize = 12;
  static double buttonMiniFontSize = 10;

  // 按钮icon字体大小
  static double buttonLargeIconFontSize = 16;
  static double buttonNormalIconFontSize = 14;
  static double buttonSmallIconFontSize = 12;
  static double buttonMiniIconFontSize = 10;

  // 按钮padding
  static double buttonLargePadding = 16;
  static double buttonNormalPadding = 14;
  static double buttonSmallPadding = 7;
  static double buttonMiniPadding = 3;
}
