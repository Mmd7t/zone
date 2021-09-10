import 'package:flutter/material.dart';

class Paginations extends StatelessWidget {
  final int length;
  final int currentPage;

  const Paginations({
    Key key,
    @required this.length,
    @required this.currentPage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.all(3),
            width: 20,
            height: 5,
            decoration: BoxDecoration(
              color: (index == currentPage)
                  ? Colors.grey.shade700
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(50),
            ),
          );
        },
      ),
    );
  }
}
