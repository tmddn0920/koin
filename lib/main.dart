import 'package:flutter/material.dart';
import 'package:koin/user/views/home_screen.dart';
import 'package:koin/user/views/auth/views/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Pretendard',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenWrapper(),
    )
  );
}