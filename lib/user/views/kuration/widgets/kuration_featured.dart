import 'package:flutter/material.dart';

class KurationFeatured extends StatelessWidget {
  final PageController controller;
  const KurationFeatured({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        controller: controller,
        children: [
          _buildFeaturedItem(
            imagePath: 'asset/img/examples/seoul_tour.jpg',
            subtitle: 'Seoul my soul',
            title: 'Seoul Cafe Tour',
            actionText: 'Read →',
          ),
          _buildFeaturedItem(
            imagePath: 'asset/img/examples/restaurant_guide.jpg',
            subtitle: 'Tasty Journey',
            title: 'Restaurant Guide',
            actionText: '바로가기 →',
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem({
    required String imagePath,
    required String subtitle,
    required String title,
    required String actionText,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard')),
                    const SizedBox(height: 4),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pretendard')),
                    const SizedBox(height: 8),
                    Text(actionText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


