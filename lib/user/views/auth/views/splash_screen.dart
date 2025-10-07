import 'dart:async';
import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/views/login_main_screen.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainLoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenUI();
  }
}

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [PRIMARY_COLOR, SPLASH_COLOR_MIDDLE, SECONDARY_COLOR],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [WHITE_COLOR, WHITE_COLOR],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: const Text(
                  'Koin',
                  style: TextStyle(
                    fontFamily: 'GapyeongHanseokbong',
                    fontSize: 72,
                    fontWeight: FontWeight.w700,
                    color: WHITE_COLOR,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      color: WHITE_COLOR,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '한국 안의 외국인',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(text: '을 위한 커뮤니티 서비스, '),
                      TextSpan(
                        text: '코인',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


