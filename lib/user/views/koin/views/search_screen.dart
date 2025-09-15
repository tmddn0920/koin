import 'package:flutter/material.dart';
import '../widgets/koin_community.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/kuration_banner.dart';
import 'package:koin/common/const/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
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
    );
  }
}
