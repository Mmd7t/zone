import 'package:flutter/material.dart';

class GlobalBackBtn extends StatelessWidget {
  const GlobalBackBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_outlined),
        color: Colors.black,
        iconSize: 20,
      ),
    );
  }
}
