import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const boldStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Bold",
);
const mediumStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Medium",
);
Widget settingListTile(
    {String iconPath, String title, String subTitle, Function onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.black),
          color: Color(0xFF0097FE),
        ),
        height: 80,
        width: 70,
        child: SvgPicture.asset(iconPath),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.black),
          color: Color(0xFF0097FE),
        ),
        height: 30,
        width: 30,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: boldStyle.copyWith(fontSize: 17),
      ),
      subtitle: Text(
        subTitle,
        style: mediumStyle.copyWith(fontSize: 11),
      ),
    ),
  );
}