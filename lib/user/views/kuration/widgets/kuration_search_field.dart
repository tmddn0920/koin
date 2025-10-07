import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KurationSearchField extends StatelessWidget {
  final VoidCallback? onAlarmTap;

  const KurationSearchField({super.key, this.onAlarmTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '게시글 검색',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: onAlarmTap,
          icon: SvgPicture.asset('asset/img/icon/Alarm_Off.svg', width: 24, height: 24),
        ),
      ],
    );
  }
}


