import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const PageIndicator({super.key, required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? PRIMARY_COLOR : Colors.grey.shade300,
            border: Border.all(color: Colors.grey.shade300),
          ),
        );
      }),
    );
  }
}


