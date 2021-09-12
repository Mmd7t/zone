import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const mediumStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Medium",
);

class BtnApp extends StatefulWidget {
  final double height;
  final double width;
  final double borderRadius;
  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Function onTap;

  const BtnApp(
      {Key key,
        this.height,
        this.width,
        this.borderRadius,
        this.title,
        this.color,
        this.textColor,
        this.borderColor,
        this.onTap})
      : super(key: key);
  @override
  _BtnAppState createState() => _BtnAppState();
}

class _BtnAppState extends State<BtnApp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 60,
      width: widget.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: widget.onTap ?? () {},
        child: Text(
          widget.title ?? "",
          style: mediumStyle.copyWith(
              fontSize: 20, color: widget.textColor ?? Colors.white),
        ),
        color: widget.color ?? Color(0xFF0097FE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
          side: BorderSide(color: widget.borderColor ?? Color(0x00000000)),
        ),
      ),
    );
  }
}
