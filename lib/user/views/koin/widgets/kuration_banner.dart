import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';
import 'kuration_view.dart';
import '../models/kuration_item.dart';

class KurationBanner extends StatelessWidget {
  const KurationBanner({super.key});

  @override
  Widget build(BuildContext context) {

    final sample = [
      KurationItem(assetPath: 'asset/img/test/Kuration_1.png', title: '강릉 놀거리 5'),
      KurationItem(assetPath: 'asset/img/test/Kuration_1.png', title: '강원도 특집'),
    ];

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 2),
                blurRadius: 10, 
                spreadRadius: 0, 
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Text(
                        '큐레이션',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GapyeongHanseokbong',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'K-uration',
                        style: TextStyle(
                          color: Color(0xFFBCBCBC),
                          fontFamily: 'GapyeongHanseokbong',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    '전체보기 →',
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontFamily: 'Pretendard',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            KurationView(items: sample),
          ],
        ),
      ),
    );
  }
}