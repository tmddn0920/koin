import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class KoinCommunity extends StatelessWidget {
  const KoinCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9).withOpacity(0.30),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '커뮤니티',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GapyeongHanseokbong',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'K-ommunity',
                      style: TextStyle(
                        color: Color(0xFFBCBCBC),
                        fontFamily: 'GapyeongHanseokbong',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '전체보기 →',
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontFamily: 'Pretendard',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildPostItem(
              '커피 제대로 하는 집 어디 없나요?',
              '추천 부탁합니다.',
              '1 minute ago',
            ),
            _buildPostItem(
              '오늘 날씨가 정말 좋네요!',
              '산책하기 딱 좋은 날씨입니다.',
              '5 minutes ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(String title, String content, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF737373),
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF737373),
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Color.fromRGBO(138, 137, 142, 0.95),
                  fontFamily: 'Pretendard',
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '|',
                style: TextStyle(
                  color: Color.fromRGBO(138, 137, 142, 0.95),
                  fontFamily: 'Pretendard',
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 6),
              Transform.translate(
                offset: const Offset(0, 1),
                child: ClipOval(
                  child: Image.asset(
                    'asset/img/icon/CountryIcon_Germany.png',
                    width: 8,
                    height: 8, 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}