import 'package:flutter/material.dart';
import 'package:koin/user/views/kuration/widgets/kuration_search_field.dart';
import 'package:koin/user/views/kuration/widgets/kuration_tabs.dart';
import 'package:koin/user/views/kuration/widgets/kuration_featured.dart';
import 'package:koin/user/views/kuration/widgets/kuration_grid.dart';
import 'package:koin/common/const/colors.dart';

class KurationScreen extends StatefulWidget {
  const KurationScreen({super.key});

  @override
  State<KurationScreen> createState() => _KurationScreenState();
}

class _KurationScreenState extends State<KurationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['전체', '음식', '어학', '생활', '문화', '행정', '장소'];
  final PageController _pageController = PageController();

  final Map<String, String> gridItems = const {
    'Beer Spot 6': 'asset/img/examples/beer.jpg',
    'Busan Cafes': 'asset/img/examples/coffee.jpg',
    'Europe in Seoul': 'asset/img/examples/europe.jpg',
    'Jeonju Course': 'asset/img/examples/jeonju.jpg',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: KurationSearchField(onAlarmTap: () {}),
            ),
            const SizedBox(height: 8),
            KurationFeatured(controller: _pageController),
            const SizedBox(height: 8),
            KurationTabs(controller: _tabController, tabs: _tabs),
            const Divider(thickness: 1, height: 1, color: Color(0xFFF0F0F0)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _tabs.map((tabName) {
                  return KurationGrid(items: gridItems);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


