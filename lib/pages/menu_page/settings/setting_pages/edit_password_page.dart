import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_zone/widgets/appBtn.dart';
import 'package:top_zone/widgets/custom_app_bar.dart';
import 'package:top_zone/widgets/custom_text_field.dart';

class EditPasswordPage extends StatefulWidget {
  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}
const mediumStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Medium",
);

class _EditPasswordPageState extends State<EditPasswordPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final oldPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customShopAppBar(context, title: "أمان الحساب", withBack: true),
        body: ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            SizedBox(height: 60),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: Colors.black),
                      color:  Color(0xFF0097FE),
                    ),
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset(
                      "assets/svg/save.svg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Text(
              "تغير كلمة المرور",
              style: mediumStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            CustomPasswordField(
              hint: "كلمة المرور القديمة",
              controller: oldPassword,
            ),
            SizedBox(height: 20),
            CustomPasswordField(
              hint: "كلمة المرور الجديدة",
              controller: passwordController,
            ),
            SizedBox(height: 20),
            CustomPasswordField(
              hint: "تأكيد كلمة المرور",
              validator: (v) {
                if (v.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  return "كلمات المرور غير متطابقة";
                } else {
                  return null;
                }
              },
              controller: confirmPasswordController,
            ),
            SizedBox(height: 60),
            BtnApp(
              title: "حفظ",
              onTap: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
