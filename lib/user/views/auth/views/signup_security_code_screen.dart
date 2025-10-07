import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/widgets/page_indicator.dart';
import 'package:pinput/pinput.dart';
import 'package:koin/user/views/auth/views/signup_reset_password_screen.dart';

class SecurityCodeScreen extends StatefulWidget {
  final String email;

  const SecurityCodeScreen({super.key, required this.email});

  @override
  State<SecurityCodeScreen> createState() => _SecurityCodeScreenState();
}

class _SecurityCodeScreenState extends State<SecurityCodeScreen> {
  final pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: WHITE_COLOR),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Security Code',
          style: TextStyle(
            color: WHITE_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.black, fontSize: 16, height: 1.5),
                children: [
                  const TextSpan(text: 'We sent numbers to your email '),
                  TextSpan(
                      text: widget.email,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enter the code to verify your identity.',
              style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            Pinput(
              controller: pinController,
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: PRIMARY_COLOR),
                ),
              ),
              onCompleted: (pin) {},
            ),
            const SizedBox(height: 30),
            const Text(
              'Not received the code?',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(206, 225, 255, 1.0),
                  elevation: 0,
                ),
                child: const Text('Resend the code',
                    style: TextStyle(color: WHITE_COLOR)),
              ),
            ),
            const Spacer(),
            const PageIndicator(length: 3, currentIndex: 1),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
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
                ),
                child: const Text('Next',
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


