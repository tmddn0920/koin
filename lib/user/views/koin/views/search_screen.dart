import 'package:flutter/material.dart';
import '../widgets/koin_community.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/kuration_banner.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:koin/user/views/home_screen.dart';

class SearchScreen extends StatelessWidget {
  final Function(int)? onTabSelected;
  const SearchScreen({super.key, this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 75,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,  
                  end: Alignment.centerRight,
                  colors: [
                    PRIMARY_COLOR, 
                    SECONDARY_COLOR,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const KurationBanner(),
            const SizedBox(height: 18),
            const KoinCommunity(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
            onTabSelected?.call(index);
          }
        },
      ),
    );
  }
}
