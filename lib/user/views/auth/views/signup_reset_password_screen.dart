import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/widgets/page_indicator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isObscured,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isObscured,
          style: const TextStyle(color: BLACK_COLOR, fontSize: 18),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: WHITE_COLOR),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reset My Password',
          style: TextStyle(
            color: WHITE_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          children: [
            _buildPasswordField(
              label: 'New Password',
              controller: _newPasswordController,
              isObscured: _isNewPasswordObscured,
              onToggleVisibility: () {
                setState(() {
                  _isNewPasswordObscured = !_isNewPasswordObscured;
                });
              },
            ),
            const SizedBox(height: 30),
            _buildPasswordField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              isObscured: _isConfirmPasswordObscured,
              onToggleVisibility: () {
                setState(() {
                  _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                });
              },
            ),
            const Spacer(),
            const PageIndicator(length: 3, currentIndex: 2),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  foregroundColor: WHITE_COLOR,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


