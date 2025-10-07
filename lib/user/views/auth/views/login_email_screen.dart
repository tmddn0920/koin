import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/home_screen.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateState);
    _passwordController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateState);
    _passwordController.removeListener(_updateState);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Image.asset('asset/img/icon/logo.png', width: 130, height: 130),
              const SizedBox(height: 20),
              const Text(
                'Koin',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontFamily: 'GapyeongHanseokbong',
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 120),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: BLACK_COLOR,
                style: const TextStyle(color: BLACK_COLOR),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  floatingLabelStyle: TextStyle(color: PRIMARY_COLOR),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: GRAY_COLOR),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                cursorColor: BLACK_COLOR,
                style: const TextStyle(color: BLACK_COLOR),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  floatingLabelStyle: const TextStyle(color: PRIMARY_COLOR),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: GRAY_COLOR),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: GRAY_COLOR,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? PRIMARY_COLOR
                        : GRAY_COLOR.withOpacity(0.3),
                    foregroundColor:
                        isButtonEnabled ? WHITE_COLOR : BLACK_COLOR,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '가입 정보가 기억나지 않나요? ',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: GRAY_COLOR,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      '계정/비밀번호 찾기',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        color: BLACK_COLOR,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


