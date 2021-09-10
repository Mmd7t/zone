import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/routes/app_pages.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key key}) : super(key: key);
  final authController = Get.find<AuthController>();

  final textStyle = Get.textTheme.subtitle1
      .copyWith(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/Scroll.png",
          ),
        ),
        ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              onTap: () =>
                  Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false),
              title: Text("الرئيسية", style: textStyle),
            ),
            ListTile(
              onTap: () {},
              title: Text("الاعدادات", style: textStyle),
            ),
            ListTile(
              onTap: () {},
              title: Text("من نحن", style: textStyle),
            ),
            ListTile(
              onTap: () {},
              title: Text("الشروط والاحكام", style: textStyle),
            ),
            ListTile(
              onTap: () => authController.logout(),
              title: Text("تسجيل الخروج",
                  style: textStyle.copyWith(color: Colors.red)),
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "تابعنا",
                    style: Get.textTheme.bodyText1
                        .copyWith(color: Get.theme.primaryColor),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: ImageIcon(Svg("assets/svg/twitter.svg")),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: ImageIcon(Svg("assets/svg/facebook.svg")),
                      color: Colors.indigo,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: ImageIcon(Svg("assets/svg/instagram.svg")),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
