import 'package:flutter/material.dart';
import 'package:flutter_vant/src/style/style.dart';

/// button type enum
enum ButtonType { primary, info, default_, warning, danger }

/// button size enum
enum ButtonSize { large, normal, small, mini }

/// button color type enum
enum ButtonColorType { backgroundColor, textColor, borderColor }

/// icon position
enum IconPositionEnum { left, right }

class Button extends StatelessWidget {
  /// button text
  final String? text;

  /// button type
  final ButtonType type;

  /// is plain button
  final bool plain;

  /// button size
  final ButtonSize size;

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
  final IconPositionEnum iconPosition;

  /// is disabled button
  final bool disabled;

  final Function? onClick;
  Button(
      {Key? key,
      this.type: ButtonType.default_,
      this.plain: false,
      this.size: ButtonSize.normal,
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
      this.iconPosition: IconPositionEnum.left,
      this.disabled: false,
      this.onClick,
      this.text})
      : super(key: key);

  Map<ButtonType, dynamic> colors = {
    ButtonType.default_: <ButtonColorType, Color>{
      ButtonColorType.backgroundColor: Style.buttonDefaultBgColor,
      ButtonColorType.borderColor: Style.buttonDefaultBdColor,
      ButtonColorType.textColor: Style.buttonDefaultColor
    },
    ButtonType.primary: <ButtonColorType, Color>{
      ButtonColorType.backgroundColor: Style.buttonPrimaryBgColor,
      ButtonColorType.borderColor: Style.buttonPrimaryBdColor,
      ButtonColorType.textColor: Style.buttonPrimaryColor
    },
    ButtonType.info: <ButtonColorType, Color>{
      ButtonColorType.backgroundColor: Style.buttonInfoBgColor,
      ButtonColorType.borderColor: Style.buttonInfoBdColor,
      ButtonColorType.textColor: Style.buttonInfoColor
    },
    ButtonType.danger: <ButtonColorType, Color>{
      ButtonColorType.backgroundColor: Style.buttonDangerBgColor,
      ButtonColorType.borderColor: Style.buttonDangerBdColor,
      ButtonColorType.textColor: Style.buttonDangerColor
    },
    ButtonType.warning: <ButtonColorType, Color>{
      ButtonColorType.backgroundColor: Style.buttonWarningBgColor,
      ButtonColorType.borderColor: Style.buttonWarningBdColor,
      ButtonColorType.textColor: Style.buttonWarningColor
    },
  };

  Map<ButtonSize, double> sizes = {
    ButtonSize.large: Style.buttonLargeHeight,
    ButtonSize.normal: Style.buttonNormalHeight,
    ButtonSize.small: Style.buttonSmallHeight,
    ButtonSize.mini: Style.buttonMiniHeight,
  };

  Map<ButtonSize, double> fontSizes = {
    ButtonSize.large: Style.buttonLargeFontSize,
    ButtonSize.normal: Style.buttonNormalFontSize,
    ButtonSize.small: Style.buttonSmallFontSize,
    ButtonSize.mini: Style.buttonMiniFontSize,
  };

  Map<ButtonSize, EdgeInsetsGeometry> paddings = {
    ButtonSize.large: Style.buttonLargePadding,
    ButtonSize.normal: Style.buttonNormalPadding,
    ButtonSize.small: Style.buttonSmallPadding,
    ButtonSize.mini: Style.buttonMiniPadding,
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
            : colors[type][ButtonColorType.backgroundColor];
      }
    }
    // 前景色
    Color? feColor;
    if (plain) {
      feColor = textColor != null
          ? textColor
          : colors[type][ButtonColorType.backgroundColor];
    } else {
      feColor = textColor != null
          ? textColor
          : colors[type][ButtonColorType.textColor];
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
            bdColor = colors[type][ButtonColorType.backgroundColor];
          }
        }
      } else {
        bdColor =
            color != null ? color : colors[type][ButtonColorType.borderColor];
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
                      : iconPosition == IconPositionEnum.right
                          ? 4
                          : 0,
                  right: this.text == null
                      ? 0
                      : iconPosition == IconPositionEnum.left
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
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              padding: paddings[size],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    iconPosition == IconPositionEnum.left
                        ? iconWidget()
                        : Container(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width -
                              paddings[size]!.horizontal * 2 -
                              iconFontSize),
                      child: Text(
                        _text!,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: feColor, fontSize: fontSizes[ButtonSize]),
                      ),
                    ),
                    iconPosition == IconPositionEnum.right
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
