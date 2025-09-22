import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/icon/my_screen/Banner.png',
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
