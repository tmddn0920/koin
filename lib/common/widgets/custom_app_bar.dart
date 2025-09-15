import 'package:flutter/material.dart';
import 'custom_icon_button.dart';
import 'package:flutter_svg/svg.dart';
import '../../user/views/koin/views/search_screen.dart';

AppBar customAppBar(BuildContext context, {Function(int)? onTabSelected}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Image.asset(
          'asset/img/icon/AppBar_Icon.png',
          width: 32,
        ),
        const SizedBox(width: 8),
        const Text(
          'Koin',
          style: TextStyle(
            color: Color(0xFF408AFA),
            fontFamily: 'GapyeongHanseokbong',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
    actions: [
      CustomIconButton(
        imagePath: 'asset/img/icon/Search.svg',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(onTabSelected: onTabSelected),
            ),
          );
        },
      ),
      CustomIconButton(
        imagePath: 'asset/img/icon/Alarm_Off.svg',
        onPressed: () {},
      ),
    ],
  );
}