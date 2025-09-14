import 'package:flutter/material.dart';

class KurationCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final double width;
  final double height;

  const KurationCard({
    super.key,
    required this.assetPath,
    required this.title,
    this.width = 260,
    this.height = 196,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18), 
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              assetPath,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.00), 
                    Colors.black.withOpacity(0.50), 
                  ],
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 18,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,                
                  fontFamily: 'Pretendard',         
                  fontSize: 20,                    
                  fontWeight: FontWeight.w700,       
                  letterSpacing: -0.4,              
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
