import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class AccountSectionWidget extends StatelessWidget {
  const AccountSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '계정',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              letterSpacing: -0.32,
            ),
          ),
          const SizedBox(height: 20),
          _buildAccountItem('아이디', 'welovek_oin'),
          const SizedBox(height: 20),
          _buildAccountItem('비밀번호 변경', ''),
          const SizedBox(height: 20),
          _buildAccountItem('이메일 변경', 'koreaninsider@gmail.com'),
        ],
      ),
    );
  }

  Widget _buildAccountItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: -0.32,
          ),
        ),
        if (value.isNotEmpty)
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF959595),
            ),
          ),
      ],
    );
  }
}
