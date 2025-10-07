import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class SelectionSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final Set<String> selectedOptions;
  final ValueChanged<String> onToggle;

  const SelectionSection({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: BLACK_COLOR)),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: options.map((option) {
            final bool isSelected = selectedOptions.contains(option);
            return ChoiceChip(
              label: Text(option),
              selected: isSelected,
              showCheckmark: false,
              onSelected: (selected) => onToggle(option),
              selectedColor: PRIMARY_COLOR,
              labelStyle: TextStyle(
                  fontFamily: 'Pretendard',
                  color: isSelected ? WHITE_COLOR : PRIMARY_COLOR,
                  fontSize: 16),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: PRIMARY_COLOR),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            );
          }).toList(),
        ),
      ],
    );
  }
}


