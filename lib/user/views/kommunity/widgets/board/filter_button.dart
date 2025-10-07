import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final String displayText;
  final bool isSelected;
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.displayText,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Text(
          displayText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blueAccent : Colors.grey[500],
            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
            decorationColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}


