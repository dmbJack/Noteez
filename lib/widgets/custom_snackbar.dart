import 'package:flutter/material.dart';

void customSnackBar({required BuildContext context, required String text}) {
  final snackForSate = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackForSate);
  Navigator.pop(context);
}
