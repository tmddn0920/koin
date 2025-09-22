import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: GRAY_COLOR,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildActionButton(
            iconPath: 'asset/img/icon/my_screen/Like.png',
            label: '좋아요',
          ),
          _buildActionButton(
            iconPath: 'asset/img/icon/my_screen/Comment.png',
            label: '댓글',
          ),
          _buildActionButton(
            iconPath: 'asset/img/icon/my_screen/Scrap.png',
            label: '스크랩',
          ),
          _buildActionButton(
            iconPath: 'asset/img/icon/my_screen/Setting.png',
            label: '기타',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String iconPath,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Image.asset(
            iconPath,
            width: 32,
            height: 32,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}
