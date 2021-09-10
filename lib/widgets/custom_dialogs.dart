import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorDialog({String title = 'حدث خطأ', String content}) {
  Get.defaultDialog(
    content: Text(
      content,
      textAlign: TextAlign.center,
    ),
    title: title,
    titleStyle: TextStyle(color: Colors.red),
    contentPadding: const EdgeInsets.all(10),
    titlePadding: const EdgeInsets.all(25),
    barrierDismissible: false,
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: const Text('حسنا'),
      ),
    ],
  );
}
