import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/shared_prefs.dart';

import '../../widgets/paginations.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  PageController pageController;

  static const List<Map<String, String>> data = [
    {
      'img': 'assets/onboarding/img1.png',
      'title': 'راحة العثور على طلباتك',
      'desc':
          'يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه'
    },
    {
      'img': 'assets/onboarding/img2.png',
      'title': 'اعتمد طلبك',
      'desc':
          'طلبيتك لورشتك او العنوان اللي تحبة في اى مكان داخل المملكة العربيه السعودية'
    },
    {
      'img': 'assets/onboarding/img3.png',
      'title': 'سرعة في التوصيل والاداء',
      'desc':
          'يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه'
    },
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: -50,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 25,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: -50,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 25,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: 3,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          child: Image.asset(data[currentPage]['img']),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: () async {
                            String apiToken =
                                await SharedPrefsHelper.getApiTokenFromPrefs();

                            print(apiToken);
                            if (apiToken != null) {
                              Get.offNamedUntil(
                                  Routes.MAIN_PAGE, (route) => false);
                            } else {
                              Get.offNamedUntil(Routes.LOGIN, (route) => false);
                            }
                          },
                          child: Text(
                            'تخطى',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Paginations(currentPage: currentPage, length: 3),
                  Expanded(
                    child: Container(
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data[currentPage]['title'],
                              style: Get.textTheme.headline6
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                data[currentPage]['desc'],
                                style: Get.textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  (currentPage == 2)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              String apiToken = await SharedPrefsHelper
                                  .getApiTokenFromPrefs();
                              if (apiToken != null) {
                                Get.offNamedUntil(
                                    Routes.MAIN_PAGE, (route) => false);
                              } else {
                                Get.offNamedUntil(
                                    Routes.LOGIN, (route) => false);
                              }
                            },
                            child: const Text(
                              'ابدأ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Get.theme.primaryColor,
                            minWidth: Get.mediaQuery.size.width * 0.8,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentPage++;
                                  });
                                },
                                child: const Text(
                                  'دخول',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Get.theme.primaryColor,
                                minWidth: Get.mediaQuery.size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Get.theme.primaryColor,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'تسجيل',
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Colors.white,
                                minWidth: Get.mediaQuery.size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Get.theme.primaryColor, width: 2),
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
        ],
      ),
    );
  }
}
