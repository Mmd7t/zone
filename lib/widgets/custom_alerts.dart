import 'package:flutter/material.dart';

void displayBottomSheet(BuildContext context, {Widget child}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (ctx) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: child,
      );
    },
  );
}