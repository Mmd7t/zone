import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          child: Text('تسجيل خروج'),
          onPressed: () {
            authController.logout();
          },
        ),
      ),
    );
  }
}
