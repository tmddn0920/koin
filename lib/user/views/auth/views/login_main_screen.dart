import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/views/login_email_screen.dart';
import 'package:koin/user/views/auth/views/signup_info_screen.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [GRADIENT_COLOR, WHITE_COLOR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.4],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Image.asset('asset/img/icon/logo.png', width: 150, height: 100),
              const SizedBox(height: 16),
              const Text(
                'Koin',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontFamily: 'GapyeongHanseokbong',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(flex: 3),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'asset/img/icon/google_logo.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  '구글로 로그인',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: WHITE_COLOR,
                  foregroundColor: BLACK_COLOR,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                    side: BorderSide(color: GRAY_COLOR.withOpacity(0.5)),
                  ),
                  elevation: 0,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'asset/img/icon/kakao_logo.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  '카카오로 로그인',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KAKAO_COLOR,
                  foregroundColor: BLACK_COLOR,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  elevation: 0,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginEmailScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  foregroundColor: WHITE_COLOR,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '이메일로 로그인',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpInfoScreen(),
                    ),
                  );
                },
                child: const Text(
                  '계정 생성',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 12,
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}


