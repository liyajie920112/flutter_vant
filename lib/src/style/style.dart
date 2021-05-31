import 'package:flutter/material.dart';

class Convert {
  static Color toColor(String color) {
    String _color = '0xff${color.substring(1)}';
    return Color(int.parse(_color));
  }
}

class Style {
  static const Color transparent = Color(0x00000000);
  static const double buttonDisabledOpacity = 0.5;
  // 按钮默认文案颜色
  static Color buttonDefaultTextColor = Convert.toColor('#ffffff');
  // 朴素按钮背景色
  static Color buttonPlainBgColor = Convert.toColor('#ffffff');

  // 边框高度
  static const double buttonBorderWidth = 1;
  static const double buttonHairlineBorderWidth = 0.5;

  // 边框圆角
  static const double buttonBorderRadius = 2;
  static const double buttonSquareBorderRadius = 0;

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
  static const double buttonLargeHeight = 48;
  static const double buttonNormalHeight = 42;
  static const double buttonSmallHeight = 30;
  static const double buttonMiniHeight = 22;

  // 按钮字体大小
  static const double buttonLargeFontSize = 16;
  static const double buttonNormalFontSize = 14;
  static const double buttonSmallFontSize = 12;
  static const double buttonMiniFontSize = 10;

  // 按钮icon字体大小
  static const double buttonLargeIconFontSize = 16;
  static const double buttonNormalIconFontSize = 14;
  static const double buttonSmallIconFontSize = 12;
  static const double buttonMiniIconFontSize = 10;

  // 按钮padding
  static EdgeInsetsGeometry buttonLargePadding =
      EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsetsGeometry buttonNormalPadding =
      EdgeInsets.symmetric(horizontal: 14);
  static EdgeInsetsGeometry buttonSmallPadding =
      EdgeInsets.symmetric(horizontal: 7);
  static EdgeInsetsGeometry buttonMiniPadding =
      EdgeInsets.symmetric(horizontal: 3);

  /***** Cell Style ******/

  static const double cellNormalFontSize = 14;
  static const double cellLargeFontSize = 16;

  static Color cellTitleColor = Convert.toColor('#323233');
  static Color cellValueColor = Convert.toColor('#969799');
}
