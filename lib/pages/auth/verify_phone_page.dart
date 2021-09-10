import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/models/verify_code_model.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/widgets/global_back_btn.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage({Key key}) : super(key: key);

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  var data = Get.arguments;
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.color1,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GlobalBackBtn(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('assets/auth_1.png'),
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
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'تأكيد ملكية الجوال',
                        style: Get.textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinPut(
                            fieldsCount: 4,
                            onSubmit: (String pin) =>
                                _showSnackBar(pin, context),
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            autovalidateMode: AutovalidateMode.always,
                            submittedFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selectedFieldDecoration: _pinPutDecoration,
                            followingFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: Constants.color1, width: 1.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () => (authController.verifyLoading.value)
                            ? SpinKitThreeBounce(
                                duration: const Duration(milliseconds: 1200),
                                color: Get.theme.colorScheme.secondary,
                                size: 25,
                              )
                            : MaterialButton(
                                onPressed: () {
                                  authController.verifyCode(VerifyCodeModel(
                                    phone: data,
                                    code: int.parse(_pinPutController.text),
                                  ));
                                },
                                child: const Text(
                                  'تأكيد',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Constants.color1,
                                minWidth: Get.mediaQuery.size.width * 0.8,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لم تحصل على الرمز؟',
                            style: Get.textTheme.subtitle1.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'اضغط هنا',
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
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 30.0,
        child: Center(
          child: Text(
            'تم ادخال الكود :: $pin',
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
