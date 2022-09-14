import 'package:flutter/material.dart';

import 'package:note_app/utils/constant.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Widget contentWidget;
  final double buttonWith;
  final Color? bgcolorOfButton;
  void Function()? onTaped;

  CustomButton({
    Key? key,
    required this.contentWidget,
    required this.buttonWith,
    this.bgcolorOfButton,
    this.onTaped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: buttonWith,
          height: 50,
          decoration: BoxDecoration(
              color: (bgcolorOfButton==null)? primaryColor:bgcolorOfButton, borderRadius: BorderRadius.circular(10)),
          child: contentWidget),
    );
  }
}
