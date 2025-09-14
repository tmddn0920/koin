import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'menu_icon_button.dart';

class KoinMenu extends StatelessWidget {
  const KoinMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFCEE1FF),
            WHITE_COLOR, 
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '내 메뉴',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'GapyeongHanseokbong',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  'My Menu',
                  style: TextStyle(
                    color: Color(0xFFBCBCBC),
                    fontFamily: 'GapyeongHanseokbong',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 12,
              children: const [
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_1.svg',
                  label: 'Chanel...',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_1.svg',
                  label: 'Editor2y',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_2.svg',
                  label: '행정',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_2.svg',
                  label: '뉴스',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_3.svg',
                  label: '어학',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_4.svg',
                  label: '주거서류',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_5.svg',
                  label: '생활',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_6.svg',
                  label: 'Setting',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}