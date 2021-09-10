import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class SignupPage1 extends StatefulWidget {
  const SignupPage1({Key key}) : super(key: key);

  @override
  _SignupPage1State createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  final formKey = GlobalKey<FormState>();
  String name, email;
  File file;

  final authController = Get.find<AuthController>();

  pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path);
      });
    } else {
      // User canceled the picker
    }
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
              padding: const EdgeInsets.all(20),
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
                    const SizedBox(height: 15),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
/*-----------------------------------------------------------------------------------*/
/*------------------------------------  Field 1  ------------------------------------*/
/*-----------------------------------------------------------------------------------*/
                          GlobalTextField.outlineBorder(
                            prefixIcon: Icons.person_outline,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            hint: 'اسم المستخدم',
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'من فضلك ادخل اسم مستخدم';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
/*-----------------------------------------------------------------------------------*/
/*------------------------------------  Field 2  ------------------------------------*/
/*-----------------------------------------------------------------------------------*/
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                const Icon(Icons.person_outline),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      (file == null)
                                          ? 'السجل التجارى'
                                          : 'تم اضافة الملف بنجاح',
                                      style: TextStyle(
                                        color: (file == null)
                                            ? Colors.grey.shade400
                                            : Get.theme.colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: file == null
                                      ? () {
                                          pickFile();
                                        }
                                      : null,
                                  child: Text('اضافة'),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  color: Get.theme.colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
/*-----------------------------------------------------------------------------------*/
/*------------------------------------  Field 3  ------------------------------------*/
/*-----------------------------------------------------------------------------------*/
                          GlobalTextField.outlineBorder(
                            prefixIcon: Icons.email_outlined,
                            borderColor: Colors.black,
                            borderRadius: 15,
                            fillColor: Colors.white,
                            hint: 'البريد الالكترونى',
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'من فضلك ادخل الايميل ';
                              } else if (!value.contains('@')) {
                                return 'من فضلك ادخل ايميل صحيح';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    GlobalBtn(
                      title: 'التالى',
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          authController.name.value = name;
                          authController.email.value = email;
                          authController.file.value = file;

                          Get.toNamed(Routes.REGISTER2);
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
                          onTap: () =>
                              Get.offNamedUntil(Routes.LOGIN, (route) => false),
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
