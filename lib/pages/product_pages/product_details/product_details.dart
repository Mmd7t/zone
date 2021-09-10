import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/models/product_details_model.dart';
import 'package:top_zone/widgets/custom_network_image.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/productRateCard.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productsController = Get.find<ProductsController>();

  int id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تفاصيل المنتج',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: const GlobalBackBtn(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Obx(
        () => (productsController.productDetailsLoading.value)
            ? Center(
                child: SpinKitThreeBounce(
                duration: const Duration(milliseconds: 1200),
                color: Get.theme.colorScheme.secondary,
                size: 25,
              ))
            : ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: CustomNetworkImage(
                      url: productsController.productDetailsDatum[0].photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: const Color(0xFFADE9F2),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsController.productDetailsDatum[0].name,
                          style: Get.textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${productsController.productDetailsDatum[0].brand.name}- ${productsController.productDetailsDatum[0].carType}",
                          style: Get.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "السعر",
                              style: Get.textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "شامل ضريبة القيمة المضافه",
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.theme.colorScheme.secondary
                                .withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${productsController.productDetailsDatum[0].price}",
                                style: Get.textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " ر.س",
                                style: Get.textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "وصف عن المنتج",
                          style: Get.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          productsController.productDetailsDatum[0].details,
                          // style: lightStyle.copyWith(fontSize: 17),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: CustomNetworkImage(
                      url: null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "معلومات عامه",
                          style: Get.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "رقم القطعه",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                            Text(
                              "#${productsController.productDetailsDatum[0].productNumber}",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "حالة القطعة",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                            Text(
                              "${productsController.productDetailsDatum[0].productCondition}",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "فترة الضمان",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                            Text(
                              productsController.productDetailsDatum[0] != null
                                  ? "item"
                                  : "لا يوجد",
                              // style: lightStyle.copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "يتطابق مع",
                          style: Get.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          itemCount: 1,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 8),
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    index.isEven ? 14 : 0),
                                border:
                                    index.isEven ? Border.all(width: 3) : null,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${productsController.productDetailsDatum[0].brand.name}",
                                    // style: lightStyle.copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    "${productsController.productDetailsDatum[0].carType} (2002)",
                                    // style: lightStyle.copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "التقيمات واراء العملاء",
                              style: Get.textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "عرض الكل",
                                style: Get.textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ProductRateCard(
                          countRate: productsController
                              .productDetailsDatum[0].ratings.length
                              .toString(),
                          rate: productsController.productDetailsDatum[0].review
                              .toString(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
