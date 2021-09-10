import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/global_back_btn.dart';

class RegisterIntro extends StatefulWidget {
  const RegisterIntro({Key key}) : super(key: key);

  @override
  _RegisterIntroState createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalBackBtn(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/normal_email.png'),
                                          backgroundColor:
                                              Get.theme.colorScheme.secondary,
                                          maxRadius: 23,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'حساب عادي',
                                          style:
                                              Get.textTheme.headline6.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'لتسهيل عمليات الشراء الخاصه بك وعمليات ملئ السله ومتبعه حركة سير المشتريات',
                                      style: Get.textTheme.subtitle1.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/vendor_email.png'),
                                          backgroundColor:
                                              Get.theme.colorScheme.secondary,
                                          maxRadius: 23,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'حساب متجر',
                                          style:
                                              Get.textTheme.headline6.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'حيث يتح لك انشاء متجر على المنصه توفر فيه منتجاتك للوصول الى قاعدة بيانات ضخمة',
                                      style: Get.textTheme.subtitle1.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: Get.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'اختر نوع حسابك',
                    style: Get.textTheme.headline5.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: Get.mediaQuery.size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Image.asset('assets/normal_email.png'),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'حساب عادى',
                                        style: Get.textTheme.headline6.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.REGISTER1),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: Get.mediaQuery.size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'حساب متجر',
                                        style: Get.textTheme.headline6.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset('assets/vendor_email.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
