import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/utils/screen_helper.dart';
import 'package:top_zone/widgets/custom_network_image.dart';

class ProductsPage extends StatelessWidget {
  final productsController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    print(productsController.productsDatum);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT1),
        child: Icon(Icons.add),
        backgroundColor: Get.theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عدد المنتجات (${productsController.productsDatum.length})',
                    style: Get.textTheme.subtitle1.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'تصفية',
                    style: Get.textTheme.bodyText1.copyWith(
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => (productsController.productsLoading.value)
                    ? Center(
                        child: SpinKitThreeBounce(
                          duration: const Duration(milliseconds: 1200),
                          color: Get.theme.colorScheme.secondary,
                          size: 25,
                        ),
                      )
                    : ListView.builder(
                        itemCount: productsController.productsDatum.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = productsController.productsDatum[index];
                          return Container(
                            // height: 194,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              splashColor: Colors.grey.shade300,
                              onTap: () {
                                productsController.getProductDetails(item.id);
                                Get.toNamed(Routes.PRODUCT_DETAILS,
                                    arguments: item.id);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Screen.scealApp(context, 106),
                                        width: Screen.scealApp(context, 89),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: CustomNetworkImage(
                                            url: item.photo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: Screen.scealApp(context, 14)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (item.asset != null &&
                                                    item.productCondition !=
                                                        null &&
                                                    item.brand != null)
                                                  Text(
                                                    " ${item.productCondition == 0 ? "جديد" : "مستعمل"} | ${item.brand.name}  ا ${item.asset.name}",
                                                    style: Get.textTheme.caption
                                                        .copyWith(
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  )
                                                else
                                                  SizedBox(),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      splashColor: Colors.green
                                                          .withOpacity(0.3),
                                                      onTap: () {},
                                                      child: ImageIcon(
                                                        Svg("assets/svg/edit.svg"),
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      splashColor: Colors.green
                                                          .withOpacity(0.3),
                                                      onTap: () {},
                                                      child: ImageIcon(
                                                        Svg("assets/svg/delet.svg"),
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height: Screen.scealApp(
                                                    context, 2)),
                                            Text(
                                              item.name,
                                              style: Get.textTheme.bodyText1,
                                            ),
                                            SizedBox(
                                                height: Screen.scealApp(
                                                    context, 2)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.green
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${item.price}",
                                                    style: Get.textTheme.caption
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    " ر.س",
                                                    style: Get.textTheme.caption
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );

                          // int getQuantityCart(int id) {
                        },
                      )

                // ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: productsController.productsDatum.length,
                //     itemBuilder: (context, index) {
                //       print(productsController.brandsList.length);
                //       return Container(
                //         margin: const EdgeInsets.symmetric(vertical: 5),
                //         padding: const EdgeInsets.all(5),
                //         height: 150,
                //         child: Row(
                //           children: [
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   // Get.toNamed(Routes.PRODUCT_DETAILS,
                //                   //     arguments:
                //                   //         snapshot.data.data[index].id);
                //                 },
                //                 child: Row(
                //                   children: [
                //                     AspectRatio(
                //                       aspectRatio: 3 / 4,
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                           color: Get.theme.primaryColor,
                //                           image: DecorationImage(
                //                             image: NetworkImage(
                //                                 productsController
                //                                     .productsDatum[index]
                //                                     .photo),
                //                             fit: BoxFit.cover,
                //                           ),
                //                           borderRadius:
                //                               BorderRadius.circular(10),
                //                           border: Border.all(
                //                               color: Colors.black, width: 3),
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(width: 8),
                //                     Expanded(
                //                       child: Container(
                //                         child: Column(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.center,
                //                           children: [
                //                             Text('مستعمل | هونداي  ا فانتي'),
                //                             Text(
                //                               productsController
                //                                   .productsDatum[index].name,
                //                               style: Get.textTheme.headline6
                //                                   .copyWith(
                //                                       fontWeight:
                //                                           FontWeight.bold),
                //                             ),
                //                             Text(
                //                                 '${productsController.productsDatum[index].price} ر.س'),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon: Icon(Icons.edit),
                //                   color: Get.theme.colorScheme.secondary,
                //                 ),
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon: Icon(CupertinoIcons.delete),
                //                   color: Constants.color2,
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                ),
          ],
        ),
      ),
    );
  }
}
