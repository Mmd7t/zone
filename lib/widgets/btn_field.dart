import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnField extends StatelessWidget {
  final Function onTap;
  final String title;
  const BtnField({Key key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.3),
        ),
        width: Get.mediaQuery.size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Row(
          children: [
            Text(
              title,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.black),
            ),
            Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
