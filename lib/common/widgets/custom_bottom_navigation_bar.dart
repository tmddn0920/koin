import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: PRIMARY_COLOR, 
      unselectedItemColor: GRAY_COLOR,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'GapyeongHanseokbong',
        fontSize: 6,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'GapyeongHanseokbong',
        fontSize: 6,
        fontWeight: FontWeight.w700,
      ),
      items: [
        _buildItem(
          label: 'Koin',
          asset: 'asset/img/icon/Bottom_Koin.svg',
          isActive: currentIndex == 0,
        ),
        _buildItem(
          label: 'Kuration',
          asset: 'asset/img/icon/Bottom_Kuration.svg',
          isActive: currentIndex == 1,
        ),
        _buildItem(
          label: 'Kommunity',
          asset: 'asset/img/icon/Bottom_Kommunity.svg',
          isActive: currentIndex == 2,
        ),
        _buildItem(
          label: 'Kamera',
          asset: 'asset/img/icon/Bottom_Kamera.svg',
          isActive: currentIndex == 3,
        ),
        _buildItem(
          label: 'My',
          asset: 'asset/img/icon/Bottom_My.svg',
          isActive: currentIndex == 4,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildItem({
    required String label,
    required String asset,
    required bool isActive,
  }) {
    final Color iconColor = isActive ? PRIMARY_COLOR : GRAY_COLOR;

    return BottomNavigationBarItem(
      label: label,
      icon: Column(
        children: [
          SvgPicture.asset(
            asset,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
