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

customSnackBar(String title, IconData icon) {
  Get.showSnackbar(GetBar(
    snackPosition: SnackPosition.TOP,
    messageText: Text(
      title,
      style: Get.textTheme.bodyText1.copyWith(color: Colors.black),
    ),
    margin: const EdgeInsets.all(8),
    duration: const Duration(milliseconds: 1700),
    backgroundColor: Get.theme.colorScheme.secondary,
    barBlur: 8.0,
    borderRadius: 15,
    icon: Icon(icon),
  ));
}
