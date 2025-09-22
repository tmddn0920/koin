import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class CameraInstructionText extends StatelessWidget {
  const CameraInstructionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text(
            'Show something or upload an image.',
            style: TextStyle(
              color: Colors.black.withOpacity(0.20),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '(You can ask though your voice.)',
            style: TextStyle(
              color: Colors.black.withOpacity(0.20),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
