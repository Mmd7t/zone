import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/models/auth_model.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phone, password;
  final authController = Get.find<AuthController>();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/logo.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: Get.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'تسجيل دخول',
                      style: Get.textTheme.headline4.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          GlobalTextField.outlineBorder(
                            prefixIcon: Icons.phone_outlined,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            hint: 'رقم الهاتف',
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'يجب ادخال رقم الهاتف';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                phone = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          GlobalTextField.outlineBorder(
                            obscure: obscure,
                            prefixIcon: Icons.lock_outlined,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            textInputType: TextInputType.visiblePassword,
                            hint: 'الرقم السرى',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                              icon: Icon((obscure)
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash),
                            ),
                            validator: (value) {
                              if (value.length < 6) {
                                return 'يجب ان يكون اكثر من 6 خانات';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'تذكر كلمة المرور',
                      style: Get.textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => (authController.loginLoading.value)
                          ? SpinKitThreeBounce(
                              duration: const Duration(milliseconds: 1200),
                              color: Get.theme.colorScheme.secondary,
                              size: 25,
                            )
                          : MaterialButton(
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  authController.login(LoginModel(
                                    phone: phone,
                                    password: password,
                                  ));
                                }
                              },
                              child: const Text(
                                'دخول',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Get.theme.colorScheme.secondary,
                              minWidth: Get.mediaQuery.size.width * 0.8,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: Get.textTheme.subtitle1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.REGISTER_INTRO),
                          child: Text(
                            'أنشئ حساب',
                            style: Get.textTheme.bodyText1.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
