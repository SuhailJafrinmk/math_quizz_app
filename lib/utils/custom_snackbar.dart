import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar customSnackbar(BuildContext context, bool isError, String message) {
  return SnackBar(
    content: Text(
      message,
    ),
    backgroundColor: isError ? CupertinoColors.destructiveRed : Colors.teal,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
