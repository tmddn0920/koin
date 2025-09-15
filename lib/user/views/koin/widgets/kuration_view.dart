import 'package:flutter/material.dart';
import 'kuration_card.dart';
import '../models/kuration_item.dart';

class KurationView extends StatelessWidget {
  final List<KurationItem> items;
  const KurationView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 16),
            child: KurationCard(
              assetPath: item.assetPath,
              title: item.title,
            ),
          );
        },
      ),
    );
  }
}