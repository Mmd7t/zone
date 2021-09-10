import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({Key key}) : super(key: key);

  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool checkBoxVal = false;
  final authController = Get.find<AuthController>();

  bool obscure1 = true;
  bool obscure2 = true;

  @override
  void initState() {
    super.initState();
    print(authController.name.value);
    print(authController.email.value);
    print(authController.file.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalBackBtn(),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'لديك فرصة لإنشاء حساب جديد إذا كنت تريد ذلك فعليك. بتعبئة البيانات المطلوبه',
                              style: Get.textTheme.subtitle1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'حساب جديد',
                      style: Get.textTheme.headline4.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          GlobalTextField.outlineBorder(
                            controller: phone,
                            prefixIcon: CupertinoIcons.phone,
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
                          ),
                          const SizedBox(height: 10),
                          GlobalTextField.outlineBorder(
                            controller: password,
                            obscure: obscure1,
                            prefixIcon: Icons.lock_outlined,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            hint: 'الرقم السرى',
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscure1 = !obscure1;
                                });
                              },
                              icon: Icon((obscure1)
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
                          ),
                          const SizedBox(height: 10),
                          GlobalTextField.outlineBorder(
                            controller: confirmPassword,
                            prefixIcon: Icons.lock_outlined,
                            obscure: obscure2,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            hint: 'تأكيد الرقم السرى',
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscure2 = !obscure2;
                                });
                              },
                              icon: Icon((obscure1)
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash),
                            ),
                            validator: (value) {
                              if (value != password.text) {
                                return 'الرقم السرى غير متطابق';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          side: BorderSide(color: Colors.black, width: 1.5),
                          value: checkBoxVal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          onChanged: (value) {
                            setState(() {
                              checkBoxVal = value;
                            });
                          },
                        ),
                        Text(
                          'الموافقة على الشروط والاحكام',
                          style: Get.textTheme.bodyText1.copyWith(
                            color: Get.theme.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GlobalBtn(
                      title: 'التالى',
                      onTap: () {
                        if (checkBoxVal) {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            authController.phone.value = phone.text;
                            authController.password.value = password.text;

                            print('phoooooooooooooooooooooooooooooooone :: ' +
                                authController.phone.value.toString());
                            print('nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :: ' +
                                authController.name.value.toString());

                            Get.toNamed(Routes.REGISTER3);
                          }
                        } else {
                          errorDialog(
                            title: 'الشروط و الاحكام',
                            content:
                                'يجب الموافقة على الشروط و الاحكام لتسجيل الحساب',
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لديك حساب بالفعل؟',
                          style: Get.textTheme.subtitle1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'اضغط هنا للدخول',
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
