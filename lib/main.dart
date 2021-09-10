import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zone',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: const Color(0xFF0197FE),
        colorScheme: ColorScheme(
          primary: const Color(0xFF0197FE),
          primaryVariant: const Color(0xFF0197FE),
          secondary: const Color(0xFF00EFB7),
          secondaryVariant: const Color(0xFF00EFB7),
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        fontFamily: 'taj',
      ),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('ar', 'EG')],
      locale: const Locale('ar', 'EG'),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
    );
  }
}
