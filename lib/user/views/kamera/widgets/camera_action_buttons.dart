import 'package:flutter/material.dart';

class CameraActionButtons extends StatelessWidget {
  const CameraActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildImageButton('asset/img/icon/kamara_screen/Camera.png', () {
          }),
          _buildImageButton('asset/img/icon/kamara_screen/Mike.png', () {
          }),
          _buildImageButton('asset/img/icon/kamara_screen/Info.png', () {
          }),
          _buildImageButton('asset/img/icon/kamara_screen/Document.png', () {
          }),
        ],
      ),
    );
  }

  Widget _buildImageButton(String imagePath, VoidCallback onPressed) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
