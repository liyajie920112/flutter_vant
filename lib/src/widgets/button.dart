import 'package:flutter/material.dart';
import 'package:flutter_vant/src/style/style.dart';

/// button type enum
enum buttonType { primary, info, default_, warning, danger }

/// button size enum
enum buttonSize { large, normal, small, mini }

/// button color type enum
enum buttonColorType { backgroundColor, textColor, borderColor }

/// icon position
enum iconPositionEnum { left, right }

class Button extends StatelessWidget {
  /// button text
  final String? text;

  /// button type
  final buttonType type;

  /// is plain button
  final bool plain;

  /// button size
  final buttonSize size;

  /// is hairline button
  final bool hairline;

  /// is square button
  final bool square;

  /// is round button
  final bool round;

  /// button icon
  final IconData? icon;

  /// is block button
  final bool block;

  /// custom button background color
  final dynamic color;

  /// text color
  final Color? textColor;

  /// border color
  final Color? borderColor;

  /// border radius
  final double borderRadius;

  /// is loading button
  final bool loading;

  /// loading text
  final String? loadingText;

  /// button icon position [left, right]
  final iconPositionEnum iconPosition;

  /// is disabled button
  final bool disabled;

  final Function? onClick;
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
      this.textColor,
      this.borderColor,
      this.borderRadius: Style.buttonBorderRadius,
      this.loading: false,
      this.loadingText,
      this.iconPosition: iconPositionEnum.left,
      this.disabled: false,
      this.onClick,
      this.text})
      : super(key: key);

  Map<buttonType, dynamic> colors = {
    buttonType.default_: <buttonColorType, Color>{
      buttonColorType.backgroundColor: Style.buttonDefaultBgColor,
      buttonColorType.borderColor: Style.buttonDefaultBdColor,
      buttonColorType.textColor: Style.buttonDefaultColor
    },
    buttonType.primary: {
      buttonColorType.backgroundColor: Style.buttonPrimaryBgColor,
      buttonColorType.borderColor: Style.buttonPrimaryBdColor,
      buttonColorType.textColor: Style.buttonPrimaryColor
    },
    buttonType.info: {
      buttonColorType.backgroundColor: Style.buttonInfoBgColor,
      buttonColorType.borderColor: Style.buttonInfoBdColor,
      buttonColorType.textColor: Style.buttonInfoColor
    },
    buttonType.danger: {
      buttonColorType.backgroundColor: Style.buttonDangerBgColor,
      buttonColorType.borderColor: Style.buttonDangerBdColor,
      buttonColorType.textColor: Style.buttonDangerColor
    },
    buttonType.warning: {
      buttonColorType.backgroundColor: Style.buttonWarningBgColor,
      buttonColorType.borderColor: Style.buttonWarningBdColor,
      buttonColorType.textColor: Style.buttonWarningColor
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

  Map<buttonSize, EdgeInsetsGeometry> paddings = {
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
    Color? bgColor;
    Gradient? gradientColor;
    bool isGradient = color is Gradient;
    if (plain) {
      bgColor = Style.buttonPlainBgColor;
    } else {
      if (color != null) {
        if (isGradient) {
          // 如果是渐变色
          bgColor = null;
          gradientColor = color;
        } else {
          bgColor = color;
        }
      } else {
        bgColor = color != null
            ? color
            : colors[type][buttonColorType.backgroundColor];
      }
    }
    // 前景色
    Color? feColor;
    if (plain) {
      feColor = textColor != null
          ? textColor
          : colors[type][buttonColorType.backgroundColor];
    } else {
      feColor = textColor != null
          ? textColor
          : colors[type][buttonColorType.textColor];
    }
    // 边框颜色
    Color? bdColor;
    if (isGradient) {
      bdColor = Colors.transparent;
    } else {
      if (plain) {
        if (color != null) {
          bdColor = color;
        } else {
          if (textColor != null) {
            bdColor = textColor;
          } else {
            bdColor = colors[type][buttonColorType.backgroundColor];
          }
        }
      } else {
        bdColor =
            color != null ? color : colors[type][buttonColorType.borderColor];
      }
    }

    Widget iconWidget() {
      if (loading) {
        return Container(
          margin: EdgeInsets.only(right: loadingText != null ? 4 : 0),
          child: SizedBox(
            height: fontSizes[size],
            width: fontSizes[size],
            child: CircularProgressIndicator(
              color: feColor,
              strokeWidth: Style.buttonBorderWidth,
            ),
          ),
        );
      }
      return icon != null
          ? Container(
              margin: EdgeInsets.only(
                  left: this.text == null
                      ? 0
                      : iconPosition == iconPositionEnum.right
                          ? 4
                          : 0,
                  right: this.text == null
                      ? 0
                      : iconPosition == iconPositionEnum.left
                          ? 4
                          : 0),
              child: Icon(
                icon,
                size: iconFontSize,
                color: feColor,
              ),
            )
          : Container();
    }

    String? _text;
    if (loadingText != null) {
      _text = loadingText;
    } else {
      _text = text != null ? text : '';
    }
    return Opacity(
      opacity: disabled ? Style.buttonDisabledOpacity : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: bgColor,
            gradient: gradientColor,
            border: Border.all(
                color: bdColor!,
                width: hairline
                    ? Style.buttonHairlineBorderWidth
                    : Style.buttonBorderWidth),
            borderRadius: BorderRadius.circular(this.square
                ? Style.buttonSquareBorderRadius
                : this.round
                    ? borderRoundRadius
                    : borderRadius)),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            focusColor: disabled || loading
                ? Style.transparent
                : Theme.of(context).focusColor,
            highlightColor: disabled || loading
                ? Style.transparent
                : Theme.of(context).highlightColor,
            hoverColor: disabled || loading
                ? Style.transparent
                : Theme.of(context).hoverColor,
            splashColor: disabled || loading
                ? Style.transparent
                : Theme.of(context).splashColor,
            borderRadius: BorderRadius.circular(this.square
                ? Style.buttonSquareBorderRadius
                : this.round
                    ? borderRoundRadius
                    : borderRadius),
            onTap: () {
              if (disabled || loading || onClick == null) {
                return;
              }
              onClick!();
            },
            child: Container(
              height: sizes[size],
              padding: paddings[size],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    iconPosition == iconPositionEnum.left
                        ? iconWidget()
                        : Container(),
                    Text(
                      _text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: feColor, fontSize: fontSizes[buttonSize]),
                    ),
                    iconPosition == iconPositionEnum.right
                        ? iconWidget()
                        : Container(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
