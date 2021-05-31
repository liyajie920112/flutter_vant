import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(),
    );
  }
}
