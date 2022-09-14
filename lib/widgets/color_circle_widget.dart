import 'package:flutter/material.dart';
import 'package:note_app/utils/constant.dart';

class ColorCircleWidget extends StatefulWidget {
  final int rangOfColor;
  final int indexChoose;
  final void Function()? onTap;
  final Color colorOfCircle;
  const ColorCircleWidget({
    Key? key,
    required this.rangOfColor,
    required this.indexChoose,
    this.onTap,
    required this.colorOfCircle,
  }) : super(key: key);

  @override
  State<ColorCircleWidget> createState() => _ColorCircleWidgetState();
}

class _ColorCircleWidgetState extends State<ColorCircleWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CircleAvatar(
        radius: 19,
        backgroundColor: (widget.indexChoose == widget.rangOfColor)
            ? bgColorOfColorChoose
            : Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: widget.colorOfCircle,
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
