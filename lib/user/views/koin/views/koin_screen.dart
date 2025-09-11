import 'package:flutter/material.dart';
import '../widgets/koin_banner.dart';

class KoinScreen extends StatelessWidget {
  const KoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BannerData> banners = [
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png',
        category: '큐레이션 K-uration',
        title: 'Koin 이용 가이드',
        subtitle: '카드뉴스 ->',
      ),
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png',
        category: '추천 콘텐츠',
        title: '인기 큐레이션',
        subtitle: '더보기',
      ),
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png', 
        category: '새로운 기능',
        title: '최신 업데이트',
        subtitle: '자세히 보기',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          KoinBanner(banners: banners),
        ],
      ),
    );
  }
}