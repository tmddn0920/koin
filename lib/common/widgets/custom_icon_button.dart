import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;
  final String? label;
  final double? width;   
  final double? height;  

  const CustomIconButton({
    Key? key,
    required this.imagePath,
    this.onPressed,
    this.label,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
    );

    if (label != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: iconWidget,
            padding: EdgeInsets.zero,
          ),
          Text(
            label!,
            style: const TextStyle(fontSize: 12, color: GRAY_COLOR),
          ),
        ],
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: iconWidget,
        padding: EdgeInsets.zero,
      );
    }
  }
}