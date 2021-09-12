import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


const mediumStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Medium",
  color: Colors.black
);

customShopAppBar(BuildContext context,
    {String title, bool withBack, bool onCard}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(title, style: mediumStyle.copyWith(fontSize: 22)),
    centerTitle: withBack == true ? true : false,
    leading: withBack == true
        ? IconButton(
      padding: const EdgeInsets.all(12.0),
      icon: SvgPicture.asset(
        "assets/svg/backIcon.svg",
      ),
      onPressed: () => Navigator.pop(context),
    )
        : SizedBox(),
//    actions: [
//      IconButton(
//        icon: ImageIcon(
//          svg.Svg("assets/svg/bell.svg"),
//          color: Colors.black,
//        ),
//        onPressed: () {
////          if (onCard != true) {
////            push(context, CartPage());
////          }
//        },
//      ),
//    ],
  );
}
