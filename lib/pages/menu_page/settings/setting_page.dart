import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/profile_controller.dart';
import 'package:top_zone/pages/menu_page/settings/setting_pages/edit_password_page.dart';
import 'package:top_zone/pages/menu_page/settings/setting_pages/time_work_page.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/appBtn.dart';
import 'package:top_zone/widgets/custom_alerts.dart';
import 'package:top_zone/widgets/custom_app_bar.dart';
import 'package:top_zone/widgets/custom_rate_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_zone/widgets/image_picker_sheet%20copy.dart';
import 'package:top_zone/widgets/setting_list_tile.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

const mediumStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Medium",
);

class _SettingPageState extends State<SettingPage> {
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: customShopAppBar(context, withBack: true, title: "الاعدادات"),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: (profileController.vendorProfileLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (profileController
                                            .getUser.value.data.photo !=
                                        null)
                                    ? Image.network(
                                        profileController
                                            .getUser.value.data.photo,
                                      )
                                    : Image.asset(
                                        "assets/error.png",
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  profileController.getUser.value.data.name,
                                  style: mediumStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CustomRateBar(
                                  rate: 5,
                                  size: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
              ),
              settingListTile(
                iconPath: "assets/svg/setting.svg",
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                title: "بيانات الحساب",
                subTitle: "الاسم-الجوال-البريد-العنوان",
              ),
              settingListTile(
                iconPath: "assets/svg/time.svg",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimeWorkPage()),
                  );
                },
                title: "أوقات العمل",
                subTitle: "مفتوح دائما",
              ),
              settingListTile(
                iconPath: "assets/svg/save.svg",
                onTap: () {
                  Get.toNamed(Routes.CHANGE_PASS);
                },
                title: "امان الحساب",
                subTitle: "كلمة المرور",
              ),
            ],
          ),
        ));
  }

  changePhoto() {
    File file;
    displayBottomSheet(
      context,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Text(
                "اضف صورة للمتجر",
                style: mediumStyle.copyWith(fontSize: 20),
              ),
              SizedBox(height: 16),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 16),
              Container(
                height: 110,
                width: 110,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 2, color: Colors.black),
                        ),
                        child: file != null
                            ? Image.file(
                                file,
                                fit: BoxFit.fill,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/error.png",
                                ),
                              ),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          ImagePickerDialog().show(
                              context: context,
                              onGet: (f) {
                                setState(() {
                                  file = f;
                                });
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border:
                                Border.all(width: 2, color: Color(0xFF0097FE)),
                          ),
                          child: SvgPicture.asset("assets/svg/edit1.svg",
                              color: Color(0xFF0097FE)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BtnApp(
                  title: "حفظ",
                  onTap: () {},
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
