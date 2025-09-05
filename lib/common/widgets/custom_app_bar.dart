import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Image.asset(
          'asset/img/icon/AppBar_Icon.png',
          width: 32,
          height: 32,
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
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: Color(0xFFD8D8D8), size: 32),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined, color: Color(0xFFD8D8D8), size: 32),
      ),
    ],
  );
}