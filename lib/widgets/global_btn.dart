import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalBtn extends StatelessWidget {
  final Function onTap;
  final String title;
  const GlobalBtn({Key key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      color: Get.theme.primaryColor,
      minWidth: Get.mediaQuery.size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.black, width: 1.3),
      ),
    );
  }
}
