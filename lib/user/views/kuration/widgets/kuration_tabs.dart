import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class KurationTabs extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const KurationTabs({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      labelColor: PRIMARY_COLOR,
      unselectedLabelColor: Colors.grey,
      indicatorColor: PRIMARY_COLOR,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: 'Pretendard',
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'Pretendard',
      ),
      tabs: tabs.map((name) => Tab(text: name)).toList(),
    );
  }
}


